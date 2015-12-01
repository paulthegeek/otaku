module Features
  module ClearanceHelpers
    def sign_in
      user = create(:user)
      sign_in_with user.email, user.password
    end

    def sign_in_with(email, password)
      visit sign_in_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_button I18n.t("helpers.submit.session.submit")
    end

    def expect_user_to_be_signed_in
      visit dashboard_path
      expect(page).to have_button I18n.t("layouts.application.sign_out")
      expect(page).to have_content("Dashboard")
    end

    def expect_user_to_be_signed_out
      expect(page).to have_button I18n.t("layouts.application.sign_in")
    end
  end
end
