require 'rails_helper'

RSpec.describe User, type: :model do
  pending describe "#owner?" do
    it "is not an owner if the role is not owner" do
      user = FactoryGirl.create(:user, role: "member")
      expect(user.owner?).to eq(false)
    end

    it "is an owner if the role is owner" do
      user = FactoryGirl.create(:user, role: "owner")
      expect(user.owner?).to eq(true)
    end
  end
end
