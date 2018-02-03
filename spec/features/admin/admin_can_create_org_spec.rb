require 'rails_helper'

describe "admin visits  dashboard  page" do
  context "as admin" do
    it "allows admin to create their organization " do
      VCR.use_cassette("user_creates_org") do
      admin = User.create(role:1)
      food = Category.create(name: 'food')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboards_path

      fill_in "organization[name]", with: "Helping out"
      fill_in "organization[state]", with: "ca"
      fill_in "organization[city]", with: "Davis"
      fill_in "organization[zipcode]", with: "95616"
      fill_in "organization[address]", with: "505 pole line rd."


      click_on 'Create Organization'

      expect(Organization.count).to eq(1)
      expect(current_path).to eq(admin_dashboards_path)
      expect(page).to have_content("#{Organization.last.name}")
      end
    end
  end
end
