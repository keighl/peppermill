require 'spec_helper'

describe Api::V1::UsersController do

  let(:user_mock) { double(Object).as_null_object }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) {
    @params = {
      format: :json
    }
  }

  describe 'POST #create' do

    before(:each) {
      @params[:user] = {}
    }

    it "creates a new user" do
      User.should_receive(:new).and_return user_mock
      user_mock.should_receive(:save).and_return true
      post :create, @params
      response.should be_success
      response.response_code.should eq(201)
      response.should render_template("me")

    end

    it "returns errors if there are any" do
      User.should_receive(:new).and_return user_mock
      user_mock.should_receive(:save).and_return false
      post :create, @params
      response.should_not be_success
      response.response_code.should eq(400)
      response.should render_template("api_errors")
    end
  end

  describe 'POST #login' do
    it "returns the current_user payload if the creds are correct" do
      @params[:email] = 'cheese'
      @params[:password] = 'cheese'
      User.should_receive(:authenticate).and_return user
      post :login, @params
      response.should be_success
      response.response_code.should eq(200)
      response.should render_template("me")
      assigns[:user].should eq user
      assigns[:current_user].should eq user
    end

    it "returns an error if the creds are incorrect" do
      @params[:email] = 'cheese'
      @params[:password] = 'cheese'
      post :login, @params
      response.should_not be_success
      response.response_code.should eq(400)
      response.should render_template("api_errors")
    end
  end

  describe 'GET #me' do

    describe 'with authentication' do
      before(:each) {
        @params[:token] = user.token
      }

      it "should be a success" do
        get :me, @params
        response.should be_success
        response.response_code.should eq(200)
        response.should render_template('me')
      end

      it "assigns current_user to @user" do
        get :me, @params
        assigns[:user].should eq(user)
      end
    end

    describe 'without authentication' do
      it "should fail with a 401" do
        @params[:token] = 'cheese'
        get :me, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end

  describe 'PUT #update' do
    describe 'with authentication' do

      before(:each) {
        @params[:token] = user.token
        controller.stubs(:current_user).returns user
      }

      it "update the current_user" do
        user.should_receive(:update_attributes).and_return true
        put :update, @params
        response.should be_success
        response.response_code.should eq(200)
        response.should render_template("me")
      end

      it "returns errors if there are any" do
        user.should_receive(:update_attributes).and_return false
        put :update, @params
        response.should_not be_success
        response.response_code.should eq(400)
        response.should render_template("api_errors")
      end
    end

    describe 'without authentication' do
      it "should fail with a 401" do
        @params[:token] = 'cheese'
        put :update, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end
end