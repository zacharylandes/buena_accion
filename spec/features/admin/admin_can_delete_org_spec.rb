require 'rails_helper'

describe "User visits dashboard page" do
  context "as admin" do
    VCR.use_cassette("user deletes an org") do
      it "allows admin to see delete an org" do
        admin = User.create(role:1)
        org=  Organization.create(name: "Helping Hands", state:'co',city:'boulder',user_id: admin.id)
        food = Category.create(name: 'food')
        need = Need.create(name:"canned goods", organization_id:org.id, category_id: food.id)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_dashboards_path


        click_on 'Delete Helping Hands'

        expect(Organization.count).to eq(0)
        expect(page).not_to have_content('Helping Hands')
      end
    end
 end
end
