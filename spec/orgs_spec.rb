require 'stsplatform'
require 'spec_helper'

config = {auth:{key_id:KEY_ID,key_password:KEY_PASSWORD}}

describe "Fields" do
  before(:each) do
    @c = STSPlatform::Client.new(config) #TODO: add conf
    @o = STSPlatform::Orgs.new(@c)
    @sensetecnic_org = STSPlatform::Orgs.new(@c, 'sensetecnic')
  end

  it "should get organizations" do
    r = @o.get()
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data[0]).to have_key('name')
  end

  it "should get an organization" do
    r = @sensetecnic_org.get()
    expect(r).to be_a STSPlatform::STSPlatformResponse
    expect(r.code).to eq("200")
    expect(r.data['name']).to eq('sensetecnic')
  end


end
