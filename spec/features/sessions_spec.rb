require 'spec_helper'

feature 'Visitor browses the website' do
  let(:valid_attributes) {
     { username:"Jenny", password: "password" }
  }
  let(:user) {User.create(valid_attributes)}

  context "on navbar" do
    it "sees a link to sign up" do
      visit root_path
      expect(page).to have_content("Sign Up")
    end

    it "goes to sign up form when clicking sign up" do
      visit root_path
      click_link "Sign Up"
      expect(page).to have_content("You're almost ready to share your story.")
    end

    it "can sign up and view profile page" do
      visit new_user_path

      expect {
      fill_in 'Username', with "octocat"
      fill_in 'Password', with "password123"
      click_link 'Submit'
      }.to change(User.count).by(1)

      page.should have_content 'You have successfully signed up.'
    end
  end


end