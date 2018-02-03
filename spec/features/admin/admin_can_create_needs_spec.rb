require 'rails_helper'

describe "User visits dashboard page" do
  context "as admin" do
  VCR.use_cassette("user_sees_one_org") do

    it "allows admin to see create a need" do
      admin = User.create(role:1)
      org=  Organization.create
      food = Category.create(name: 'food')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboards_path

      fill_in "need[name]", with: "canned goods"
      select "food", :from => "need[category_id]"
      click_on 'submit'

        save_and_open_page
      expect(Need.count).to eq(1)
      expect(page).to have_content('canned goods')
    end
    end
  end
end
