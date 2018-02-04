class OrganizationsController < ApplicationController

  def index
    if params['order']
      @orgs = Organization.order("#{params['order']} DESC").paginate(:page => params[:page], :per_page => 30)
    else
      @organization  = Organization.where()
      @orgs = Organization.order("city ASC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  def create
    if current_admin?
      address = [org_params['address'], org_params['state'].upcase, org_params['city'].downcase, org_params['zipcode']]
      org = {
        name: org_params['name'],
        url: org_params['website'],
        city: org_params['city'],
        address: address,
        user_id: params['organization'][:user_id]
      }
      Organization.create!(org)
      redirect_to admin_dashboards_path
    else
      state = params['organization']['state'].upcase
      city = params['organization']['city'].downcase
      response = CharityService.new.connection(ENV['client_id'],ENV['client_secret'],state,city)
      redirect_to organizations_path
    end
  end

  def show
    @org = Organization.find(params[:id])
  end

  private


  def org_params
      params.require(:organization).permit(:name, :state, :city, :zipcode, :address)
  end


end
