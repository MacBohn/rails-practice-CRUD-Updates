require 'rails_helper'

 feature 'update' do
   scenario "user can't create status with nothing in fields" do
      visit updates_path
      click_on "New Update"
      click_on "Create Update"
      expect(page).to have_content("errors prohibited")
   end
     scenario "user can create and edit and destroy" do
       visit updates_path
       click_on "New Update"
       fill_in "Status", with: "Have a good day"
       fill_in "User", with: "MAC"
       fill_in "Likes", with: "100"
       click_on "Create Update"
       expect(page).to have_no_content("errors prohibited")

       click_on "MAC"
       fill_in "Status", with: "Have a bad day"
       fill_in "User", with: "mac"
       fill_in "Likes", with: "999999"
       click_on "Update Update"
      expect(page).to have_content("999999")
      click_on "Destroy"
      expect(page).to have_no_content("999999")
       save_and_open_page
     end

 end
