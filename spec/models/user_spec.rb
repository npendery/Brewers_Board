require 'rails_helper'

RSpec.describe User, type: :model, focus: true do
  describe "#admin?" do
    it "is not an admin if the admin attribute is false" do
      user = FactoryGirl.create(:user)
      expect(user.admin).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = FactoryGirl.create(:user, admin: true)
      expect(user.admin).to eq(true)
    end
  end
end
