require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }

    it "validates uniqueness of the user's username" do
      create(:user, username: "geek")
      user_with_duplicate_username = build(:user, username: "geek")

      expect(user_with_duplicate_username).not_to be_valid
    end
  end
end
