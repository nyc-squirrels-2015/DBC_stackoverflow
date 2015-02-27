require 'rails_helper'

describe Comment do
  context "validations" do
    it { should validate_presence_of :content}
    it { should validate_presence_of :user}
    it { should validate_presence_of :commentable}
  end

end
