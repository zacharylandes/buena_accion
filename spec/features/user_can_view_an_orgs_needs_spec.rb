require 'rails_helper'
describe 'user can view an organization' do
  it  'shows the org and need posted by the org ' do
    VCR.use_cassette("user sees an orgs needs") do
      User.create!(name:"zach")
      Category.create(name:"food")
      Organization.create!(
        name:"Winters Health care",
        state: 'ca',
        city: 'winters',
        address: "454 Russell st.",
        user_id: User.first.id
        )
        Organization.first.needs.create!(name: "food", category_id: Category.last.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.first)
      visit '/organizations'
      fill_in 'organization[state]', with: "ca"
      fill_in 'organization[city]', with: "winters"
      click_on 'Search'

      first("td").first(:link).click

      expect(page).to have_content("This Organization's needs")
      expect(page).to have_content("food")
    end
  end
end
