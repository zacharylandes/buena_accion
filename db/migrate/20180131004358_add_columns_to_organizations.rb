class AddColumnsToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :mission, :string
    add_column :organizations, :url, :string
    add_column :organizations, :cat_name, :string
  end
end
