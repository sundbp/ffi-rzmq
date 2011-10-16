
require File.join(File.dirname(__FILE__), %w[spec_helper])

module ZMQ


  describe Message do

    context "when initializing with an argument" do

      it "calls zmq_msg_init_data()" do
        LibZMQ.should_receive(:zmq_msg_init_data)
        message = Message.new "text"
      end

      it "should *not* define a finalizer on this object" do
        ObjectSpace.should_not_receive(:define_finalizer)
        Message.new "text"
      end
    end # context initializing with arg

    context "when initializing *without* an argument" do

      it "calls zmq_msg_init()" do
        LibZMQ.should_receive(:zmq_msg_init).and_return(0)
        message = Message.new
      end

      it "should *not* define a finalizer on this object" do
        ObjectSpace.should_not_receive(:define_finalizer)
        Message.new "text"
      end
    end # context initializing with arg


    context "#copy_in_string" do
      it "calls zmq_msg_init_data()" do
        message = Message.new "text"

        LibZMQ.should_receive(:zmq_msg_init_data)
        message.copy_in_string("new text")
      end

      it "correctly finds the length of binary data by ignoring encoding" do
        message = Message.new
        message.copy_in_string("\x83\x6e\x04\x00\x00\x44\xd1\x81")
        message.size.should == 8
      end
    end


    context "#copy" do
      it "calls zmq_msg_copy()" do
        message = Message.new "text"
        copy = Message.new

        LibZMQ.should_receive(:zmq_msg_copy)
        copy.copy(message)
      end
    end # context copy


    context "#move" do
      it "calls zmq_msg_move()" do
        message = Message.new "text"
        copy = Message.new

        LibZMQ.should_receive(:zmq_msg_move)
        copy.move(message)
      end
    end # context move


    context "#size" do
      it "calls zmq_msg_size()" do
        message = Message.new "text"

        LibZMQ.should_receive(:zmq_msg_size)
        message.size
      end
    end # context size


    context "#data" do
      it "calls zmq_msg_data()" do
        message = Message.new "text"

        LibZMQ.should_receive(:zmq_msg_data)
        message.data
      end
    end # context data


    context "#close" do
      it "calls zmq_msg_close() the first time" do
        message = Message.new "text"

        LibZMQ.should_receive(:zmq_msg_close)
        message.close
      end

      it "*does not* call zmq_msg_close() on subsequent invocations" do
        message = Message.new "text"
        message.close

        LibZMQ.should_not_receive(:zmq_msg_close)
        message.close
      end
    end # context close

    context "#strhex" do
      it "handles #strhex via ZMQ::Util.strhex" do
        str = "foobar"
        begin
          msg = ZMQ::Message.new(str)
          ZMQ::Util.stub(:strhex).and_return("ok")
          msg.strhex.should == "ok"
        ensure
          msg.close unless msg.nil?
        end
      end
    end # context strhex
    
    context "#duplicate" do
      it "duplicates itself correctly" do
        begin
          msg = ZMQ::Message.new("foo")
          msg2 = msg.duplicate
          msg2.copy_out_string.should == msg.copy_out_string
        ensure
          msg.close unless msg.nil?
          msg2.close unless msg2.nil?
        end
      end
    end # context duplicate
    
    context "#to_s" do
      it "has a string representation via #to_s" do
        begin
          msg = ZMQ::Message.new("foobar")
          msg.to_s.should match(/foobar/)
        ensure
          msg.close unless msg.nil?
        end
      end
    end # context to_s
  
    context "#empty?" do
      it "knows if it is empty or not" do
        begin
          msg = ZMQ::Message.new
          msg.should be_empty
          msg2 = ZMQ::Message.new("")
          msg2.should be_empty
          msg3 = ZMQ::Message.new("foo")
          msg3.should_not be_empty
        ensure
          msg.close unless msg.nil?
          msg2.close unless msg.nil?
          msg3.close unless msg.nil?
        end
      end
    end # context to_s

  end # describe Message


  describe ManagedMessage do

    context "when initializing with an argument" do

      it "should define a finalizer on this object" do
        ObjectSpace.should_receive(:define_finalizer)
        ManagedMessage.new "text"
      end
    end # context initializing


  end # describe ManagedMessage


end # module ZMQ
