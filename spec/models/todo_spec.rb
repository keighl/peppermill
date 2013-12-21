require 'spec_helper'

describe Todo do

  let(:todo) { FactoryGirl.create(:todo) }

  it "generall works" do
    todo.should_not be_nil
  end

  describe 'priority interface' do

    TODO_PRIORITIES.each do |k, v|
      it "maps #{k} correctly" do
        todo.update_attribute :priority, k
        todo.read_attribute(:priority).should eq(v)
      end
    end
  end
end
