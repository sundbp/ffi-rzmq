require File.join(File.dirname(__FILE__), %w[spec_helper])

describe ZMQ::Util do
  
  it "should correctly handle #strhex" do
    ZMQ::Util.strhex("foobar").should == "666F6F626172"
    ZMQ::Util.strhex("1234567890ABCDEF").should == "31323334353637383930414243444546"
  end
  
end