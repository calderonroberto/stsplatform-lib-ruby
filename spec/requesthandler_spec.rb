require 'stsplatform'

describe "RequestHandler" do

  #allow private methods to be accessed for tests
  before(:each) do
    STSPlatform::RequestHandler.send(:public, *STSPlatform::RequestHandler.private_instance_methods)
  end
  it "should have config methods" do #TODO
    rh = STSPlatform::RequestHandler.new()
    expect(rh).to respond_to(:set_config).with(1).argument
    expect(rh).to respond_to(:set_handler).with(1).argument
  end
  it "should have REST methods" do
    rh = STSPlatform::RequestHandler.new()
    expect(rh).to respond_to(:get).with(2).argument
    expect(rh.get()).to be_a STSPlatform::STSPlatformResponse
    expect(rh).to respond_to(:post).with(2).argument
    expect(rh.post()).to be_a STSPlatform::STSPlatformResponse
    expect(rh).to respond_to(:put).with(2).argument
    expect(rh.put()).to be_a STSPlatform::STSPlatformResponse
    expect(rh).to respond_to(:delete).with(2).argument
    expect(rh.delete()).to be_a STSPlatform::STSPlatformResponse
  end

  it "should have response handler" do
    rh = STSPlatform::RequestHandler.new()
    expect(rh).to respond_to(:handle_response).with(1).argument
  end

  it "should have authentication handler" do
    #requesthandler
    rh = STSPlatform::RequestHandler.new()
    c_empty = STSPlatform::Client.new()
    expect(c_empty.handle_authentication()).to eq(nil)
    auth = {key_id:"key",key_password:"password"}
    config = {auth:auth}
    #client should work
    c_auth = STSPlatform::Client.new(config)
    expect(c_auth.handle_authentication()).to eq(auth)
  end

  it "should have parameters handler" do
    rh = STSPlatform::RequestHandler.new()
    expect(rh.handle_params(nil)).to eq({})
    expect(rh.handle_params({value:"d"})).to eq({value:"d"})
  end

  it "should have payload handler" do
    rh = STSPlatform::RequestHandler.new()
    expect{rh.handle_payload("bad")}.to raise_error(STSPlatform::STSPlatformError)
    expect(rh.handle_payload({value:1})).to eq("{\"value\":1}")
    expect(rh.handle_payload(nil)).to eq("{}")
  end

  it "should initialize default values" do
    rh = STSPlatform::RequestHandler.new()
    expect(rh.url).to eq("http://wotkit.sensetecnic.com/api")
  end
end
