require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "generall works" do
    user.should_not be_nil
  end

  describe "validations" do
    it 'requires a valid email' do
      user = FactoryGirl.build(:user, email: 'fishy')
      user.save.should be_false
      user.should have(1).error_on(:email)
    end

    describe 'on create' do
      it "requires a password password_confirmation" do
        user                       = FactoryGirl.build(:user, password: "cheese")
        user.password_confirmation = nil
        user.save.should be_false
        user.should have(1).error_on(:password_confirmation)
      end

      it "requires a password password_confirmation match" do
        user = FactoryGirl.build(:user, password_confirmation: "polkatime")
        user.save.should be_false
        user.should have(1).error_on(:password)
      end
    end

    describe "on update" do
      it "doesn't require a password we're not updating it specifically" do
        user.update_attributes(username: "weirdal").should be_true
        user.should have(0).error_on(:password)
      end

      it "doesn't require a password_confirmation we're not updating" do
        user.update_attributes(username: "weirdal").should be_true
        user.should have(0).error_on(:password_confirsmation)
      end

      it "requires a password_confirmation when they try to change their password" do
        user.update_attributes(password: "polkatime", :password_confirmation => "").should be_false
        user.should have(1).error_on(:password_confirmation)
      end

      it "requires a password_confirmation match when they try to change their password" do
        user.update_attributes(password: "polkatime", password_confirmation: "policia").should be_false
        user.should have(1).error_on(:password)
      end
    end
  end
end
