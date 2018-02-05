class OrganizationsController < ApplicationController

  def index
    if params['order']
      @orgs = OrgSearchService.new.order(params['order'])
    elsif params['name'] || params['city'] || params['state'] || params['needs']
      @orgs = OrgSearchService.new.search(params)
    else

      @orgs = Organization.order("city ASC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  def create
      address = [org_params['address'].downcase, org_params['state'].upcase, org_params['city'].downcase, org_params['zipcode']]
      org = {
        name: org_params['name'].downcase,
        city: org_params['city'].downcase,
        address: address,
        user_id: params['organization'][:user_id]
      }
      Organization.create!(org)
      redirect_to admin_dashboards_path
  end

  def show
    @org = Organization.find(params[:id])
  end

  def destroy
    org = Organization.find(params[:id])
    org.destroy

    redirect_to admin_dashboards_path
  end
  private

  def org_params
      params.require(:organization).permit(:name, :state, :city, :zipcode, :address)
  end


end
