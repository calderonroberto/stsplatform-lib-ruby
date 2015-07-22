require 'stsplatform'

describe "Client" do
  it "should initialize without config" do
    c = STSPlatform::Client.new()
    expect(c.url).to eq("http://wotkit.sensetecnic.com/api")
  end

  it "should initialize with custom configs" do
    config_url = {url:"http://newurl.com"}
    c = STSPlatform::Client.new(config_url)
    expect(c.url).to eq("http://newurl.com")
    config_auth = {auth:{key_id:"mykey",key_password:"mypassword"}}
    c = STSPlatform::Client.new(config_auth)
    expect(c.auth[:key_id]).to eq("mykey")
    expect(c.auth[:key_password]).to eq("mypassword")
    config_auth_username = {auth:{username:"mykey",password:"mypassword"}}
    c = STSPlatform::Client.new(config_auth)
    expect(c.auth[:key_id]).to eq("mykey")
    expect(c.auth[:key_password]).to eq("mypassword")
  end

  it "should have methods" do #TODO
    c = STSPlatform::Client.new()
    expect(c).to respond_to(:get).with(2).argument
    #TODO: add other methods
  end



end
