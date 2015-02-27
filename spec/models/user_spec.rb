require 'rails_helper'

describe User do
  context "validations" do
    # let(:user) {FactoryGirl.build :user, password:"123"}
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
  end

  # context "#name" do
  #   let(:user) {FactoryGirl.build :user, password: "password"}
  #   it ""
  # end
end
