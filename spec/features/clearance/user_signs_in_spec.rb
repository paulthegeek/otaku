require "rails_helper"
require "support/features/clearance_helpers"

feature "User signs in" do
  scenario "with valid email and password" do
    create_user "user@example.com", "user", "password"
    sign_in_with "user@example.com", "password"

    expect_user_to_be_signed_in
  end
end

private

def create_user(email, username, password)
  create(:user,
          email: email,
          username: username,
          password: password
        )
end
