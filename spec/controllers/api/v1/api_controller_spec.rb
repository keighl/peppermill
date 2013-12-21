require 'spec_helper'

describe Api::V1::ApiController do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) {
    @params = {
      token: user.token,
      format: :json
    }
  }

  describe 'user authentication' do

    it "sets the current_user to user when creds are valid" do
      get :index, @params
      response.should be_success
      assigns[:current_user].should eq(user)
    end

    it "renders an error when the creds are invalid" do
      @params[:token] = 'cheese'
      get :index, @params
      response.should_not be_success
      response.response_code.should eq(401)
      response.should render_template('api_errors')
    end
  end

  describe 'exception handling' do
    it "catches exceptions, and returns an error endpoint" do
      env = double(Object).as_null_object
      Rails.stub(:env).and_return env
      env.should_receive(:development?).and_return false
      env.should_receive(:test?).and_return false
      controller.should_receive(:index).and_raise Exception
      get :index, @params
    end
  end
end
