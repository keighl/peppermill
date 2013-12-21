require 'spec_helper'

describe Todo do

  let(:todo) { FactoryGirl.create(:todo) }

  it "generall works" do
    todo.should_not be_nil
  end
end
