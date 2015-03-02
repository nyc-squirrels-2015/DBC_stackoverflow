require 'rails_helper'

describe Question do
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :user }
  end
end
