require 'rails_helper'
describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do
      admin = User.create(role:1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboards_path

      expect(page).to have_selector(:link_or_button, 'Create Organization')
    end
  end

  context "as default user" do
  it 'does not allow default user to see admin categories index' do
    user = User.create(role:0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_dashboards_path
    expect(page).to_not have_content("Create Organization")
    expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
