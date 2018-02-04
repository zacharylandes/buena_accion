require 'rails_helper'
describe 'user can view an organization' do
  before(:each) do
    @user =  User.create
     Organization.create(name: 'Vegan Outreach', state:'ca', city:"Davis")
  end
    it  'shows the organization that was clicked ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      VCR.use_cassette("user_sees_one_org") do
      visit '/organizations'
      fill_in 'state', with: "ca"
      fill_in 'city', with: "Davis"
      click_on 'Search'
      first("td").first(:link).click
      expect(page).to have_content("Davis")
    end
  end
end
