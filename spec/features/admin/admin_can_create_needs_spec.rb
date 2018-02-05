require 'rails_helper'

describe "User visits dashboard page" do
  before(:each) do
    admin = User.create(role:1)
    org=  Organization.create!(user_id: admin.id)
    food = Category.create(name: 'food')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "as admin" do
    VCR.use_cassette("user creates a need") do
      it "allows admin to see create a need" do

        visit admin_dashboards_path

        fill_in "need[name]", with: "canned goods"
        select "food", :from => "need[category_id]"
        click_on 'Create Need'

        expect(Organization.first.needs.count).to eq(1)
        expect(page).to have_content('canned goods')
      end
    end
 end
  context "as admin" do
    VCR.use_cassette("user can see an organizations need on index page") do
      it "allows admin to see create a need" do

        visit admin_dashboards_path

        fill_in "need[name]", with: "vegetables"
        select "food", :from => "need[category_id]"
        fill_in "need[amount]", with: "76"

        click_on 'Create Need'

        visit organizations_path

        # binding.pry
        expect(page).to have_content('vegetables')

      end
    end
 end
end
