require 'spec_helper'

describe ApplicationController do

  describe "robots.txt" do
    it "works in development" do
      Rails.stub(:env).and_return('development')
      get :robots
      response.body.should eq(File.read(Rails.root.join('config', 'robots', 'development.txt')))
    end

    it "works in staging" do
      Rails.stub(:env).and_return('staging')
      get :robots
      response.body.should eq(File.read(Rails.root.join('config', 'robots', 'staging.txt')))
    end

    it "works in production" do
      Rails.stub(:env).and_return('production')
      get :robots
      response.body.should eq(File.read(Rails.root.join('config', 'robots', 'production.txt')))
    end
  end
end
