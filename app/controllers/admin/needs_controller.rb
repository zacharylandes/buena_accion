class Admin::NeedsController < Admin::BaseController

  def create
    Need.create!(need_params)
    redirect_to admin_dashboards_path
  end

private

  def need_params
      params.require(:need).permit(:name, :category_id, :amount)
  end

end
