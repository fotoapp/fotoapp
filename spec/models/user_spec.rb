require 'spec_helper'

describe User do
  describe "#username" do
    it "validates_presence_of" do
      user = User.make :username => nil

      expect(user).to_not be_valid
      expect(user.errors.messages).to eq({:username=>["can't be blank"]})
    end
  end
end
