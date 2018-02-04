class Admin::DashboardsController < Admin::BaseController
  def index
    @categories= Category.all
    @organization = Organization.new
    @needs = Organization.find_by(user_id: params[:user_id]).needs.all if Organization.find_by(user_id: params[:user_id])
    @need = Organization.find_by(user_id: params[:user_id]).needs.new
  end

end
