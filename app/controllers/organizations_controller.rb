class OrganizationsController < ApplicationController

  def index
    @organization = Organization.new
    if params['order']
      @orgs = Organization.order("#{params['order']} DESC").paginate(:page => params[:page], :per_page => 30)
    else
      @orgs = Organization.order("city ASC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  def create
    state = params['organization']['state'].upcase
    city = params['organization']['city'].downcase
    response = CharityService.new.connection(ENV['client_id'],ENV['client_secret'],state,city)
    redirect_to organizations_path
  end

  def show
    @org = Organization.find(params[:id])
  end

end
