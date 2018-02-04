class Admin::NeedsController < Admin::BaseController
  def create
    need = Need.create(need_params)

    redirect_to admin_dashboards_path
  end

  def destroy
    need= Need.find(params[:id])
    need.destroy

    redirect_to admin_dashboards_path
  end

private

  def need_params
      params.require(:need).permit(:name, :category_id, :amount, :organization_id)
  end

end
