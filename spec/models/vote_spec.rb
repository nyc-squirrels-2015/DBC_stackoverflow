require 'rails_helper'

describe Vote do
  context "validations" do
    it { should validate_presence_of :user}
    it { should validate_presence_of :votable}
  end
end
