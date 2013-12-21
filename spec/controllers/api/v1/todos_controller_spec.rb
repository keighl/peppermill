require 'spec_helper'

describe Api::V1::TodosController, focus: true do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) {
    @params = {
      token: user.token,
      format: :json
    }
  }

  describe '#index' do

    describe 'with authentication' do

      let(:todos_mock) { double(Object).as_null_object }

      before(:each) {
        user.stubs(:todos).returns todos_mock
        controller.stubs(:current_user).returns user
      }

      it "is a success" do
        get :index, @params
        response.should be_success
        response.response_code.should eq(200)
        response.should render_template('index')
      end

      it "assigns completed todos to @todos[:complete]" do
        complete_todos = []
        todos_mock.should_receive(:complete).and_return complete_todos
        get :index, @params
        assigns[:todos][:complete].should eq(complete_todos)
      end

      it "assigns incomplete todos to @todos[:incomplete]" do
        incomplete_todos = []
        todos_mock.should_receive(:incomplete).and_return incomplete_todos
        get :index, @params
        assigns[:todos][:incomplete].should eq(incomplete_todos)
      end
    end

    describe 'without authentication' do

      it "it fails with a 401" do
        @params[:token] = 'cheese'
        get :index, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end

  describe '#show' do

    let(:todo) { FactoryGirl.create(:todo, user: user) }

    before(:each) {
      @params[:id] = todo.id
    }

    describe 'with authentication' do

      before(:each) {
        controller.stubs(:current_user).returns user
      }

      it "is a success" do
        get :show, @params
        response.should be_success
        response.response_code.should eq(200)
        response.should render_template('show')
      end

      it "assigns the todo to @todo" do
        get :show, @params
        response.should be_success
        response.response_code.should eq(200)
        response.should render_template('show')
      end

      it "returns 404 for todos that don't belong to the user" do
        todo         = FactoryGirl.create :todo
        @params[:id] = todo.id
        lambda {
          get :show, @params
        }.should raise_error
      end
    end

    describe 'without authentication' do
      it "it fails with a 401" do
        @params[:token] = 'cheese'
        get :show, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end

  ##################################################################

  describe "POST #create" do

    describe 'with authentication' do

      let(:todos_mock) { double(Object).as_null_object }
      let(:todo_mock) { double(Object).as_null_object }

      before(:each) {
        user.stubs(:todos).returns todos_mock
        controller.stubs(:current_user).returns user
        @params[:todo] = {}
      }

      it "creates a new todo" do
        todos_mock.should_receive(:build).and_return(todo_mock)
        todo_mock.should_receive(:save).and_return true
        post :create, @params
        response.should render_template("show")
        response.response_code.should eq(201)
      end

      it "returns errors if there are any" do
        todos_mock.should_receive(:build).and_return(todo_mock)
        todo_mock.should_receive(:save).and_return false
        post :create, @params
        response.should render_template("api_errors")
        response.response_code.should eq(400)
      end
    end

    describe 'without authentication' do
      it "it fails with a 401" do
        @params[:token] = 'cheese'
        post :create, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end

  ##################################################################

  describe "PUT #update" do

    describe 'with authentication' do

      let(:todos_mock) { double(Object).as_null_object }
      let(:todo_mock) { double(Object).as_null_object }

      before(:each) {
        controller.stubs(:current_user).returns user
        @params[:id]   = todo_mock.id
        @params[:todo] = {}
      }

      it "updates the todo" do
        user.stubs(:todos).returns todos_mock
        todos_mock.should_receive(:find).and_return todo_mock
        todo_mock.should_receive(:update_attributes).and_return true
        put :update, @params
        response.should render_template("show")
        response.response_code.should eq(200)
      end

      it "returns errors if there are any" do
        user.stubs(:todos).returns todos_mock
        todos_mock.should_receive(:find).and_return todo_mock
        todo_mock.should_receive(:update_attributes).and_return false
        put :update, @params
        response.should render_template("api_errors")
        response.response_code.should eq(400)
      end

      it "returns 404 for todos that don't belong to the user" do
        todo         = FactoryGirl.create :todo
        @params[:id] = todo.id
        lambda {
          put :update, @params
        }.should raise_error
      end
    end

    describe 'without authentication' do
      it "it fails with a 401" do
        @params[:token] = 'cheese'
        @params[:id]    = 300
        put :update, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end

    # ##################################################################

  describe "DELETE #destroy" do


    describe 'with authentication' do

      let(:todos_mock) { double(Object).as_null_object }
      let(:todo_mock) { double(Object).as_null_object }

      before(:each) {
        controller.stubs(:current_user).returns user
        @params[:id] = todo_mock.id
      }

      it "should delete the todo" do
        user.stubs(:todos).returns todos_mock
        todos_mock.should_receive(:find).and_return todo_mock
        todo_mock.should_receive(:destroy).and_return true
        delete :destroy, @params
        response.response_code.should eq(200)
        response.should render_template("api/v1/application/api_message")
      end

      it "should return errors if there is a problem" do
        user.stubs(:todos).returns todos_mock
        todos_mock.should_receive(:find).and_return todo_mock
        todo_mock.should_receive(:destroy).and_return false
        delete :destroy, @params
        response.response_code.should eq(400)
        response.should render_template("api/v1/application/api_errors")
      end

      it "returns 404 for todos that don't belong to the user" do
        todo         = FactoryGirl.create :todo
        @params[:id] = todo.id
        lambda {
          delete :destroy, @params
        }.should raise_error
      end
    end

    describe 'without authentication' do
      it "it fails with a 401" do
        @params[:token] = 'cheese'
        @params[:id]    = 300
        delete :destroy, @params
        response.should_not be_success
        response.response_code.should eq(401)
        response.should render_template('api_errors')
      end
    end
  end
end
