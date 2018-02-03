require 'rails_helper'
describe 'user can search organizations' do
  let(:user) {User.create()}
    it  'shows the organizations that were searched ' do
      VCR.use_cassette("user_searches_by_state") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/organizations'
      fill_in 'organization[state]', with: "ca"
      fill_in 'organization[city]', with: "Sacramento"
      click_on 'Search'

      expect(Organization.count).to  eq 10
    end
  end
end
