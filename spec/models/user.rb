require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    
    it "validates uniqueness of the user's email" do
      user_1 = create(:user, email: "geek@geek.com")
      user_2 = build(:user, email: "geek@geek.com")
      
      expect(user_2.save).to eq false
    end
    
    it "validates uniqueness of the user's username" do
      user_1 = create(:user, username: "geek")
      user_2 = build(:user, username: "geek")
      
      expect(user_2.save).to eq false
    end
  end
end
