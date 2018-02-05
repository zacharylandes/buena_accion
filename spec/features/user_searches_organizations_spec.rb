require 'rails_helper'

describe 'user can search organizations' do
  before(:each) do
    @user =  User.create
     Organization.create(name: 'Vegan Outreach', state:'ca', city:"Davis")
  end

  it  'shows the organizations that were searched by name ' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/organizations'
    fill_in 'name', with: "Vegan"
    click_on 'Search'

    expect(Organization.first).to  have_attributes(name: "Vegan Outreach")
  end

    it  'shows the organizations that were searched by state ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/organizations'
      fill_in 'state', with: "CA"
      click_on 'Search'

      expect(Organization.first).to  have_attributes(name: "Vegan Outreach")
  end

    it  'shows the organizations that were searched by city ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/organizations'
      fill_in 'city', with: "davis"
      click_on 'Search'

      expect(Organization.first).to  have_attributes(name: "Vegan Outreach")
  end
    it  'shows the organizations that were searched by city ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/organizations'
      fill_in 'needs', with: "vegan"
      click_on 'Search'
      expect(Organization.first).to  have_attributes(name: "Vegan Outreach")
  end
end
