require 'rails_helper'
describe 'user can view an organization' do
  let(:user) {User.create()}
    it  'shows the organization that was clicked ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette("user_sees_one_org") do
      visit '/organizations'
      fill_in 'organization[state]', with: "ca"
      fill_in 'organization[city]', with: "Sacramento"
      click_on 'Search'
      first("td").first(:link).click
      expect(page).to have_content("Score")
    end
  end
end
