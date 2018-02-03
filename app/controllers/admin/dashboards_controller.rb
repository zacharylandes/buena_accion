class Admin::DashboardsController < Admin::BaseController
  def index
    @need = Need.new
    @needs = Need.all
    @categories= Category.all
    @organization = Organization.new 
  end

end
