require "rails_helper"

feature "User signs up" do
  scenario "by navigating to the page" do
    visit sign_in_path

    click_link t("sessions.form.sign_up")

    expect(page).to have_selector("#user_email", visible: true)
  end

  scenario "with a valid email, username, and password" do
    sign_up_with "valid@example.com", "user", "password"

    expect_user_to_be_signed_in
  end

  scenario "tries with invalid email" do
    sign_up_with "invalid_email", "user", "password"

    expect_user_to_be_on_sign_up
  end

  scenario "tries with blank password" do
    sign_up_with "valid@example.com", "user", ""

    expect_user_to_be_on_sign_up
  end
end
