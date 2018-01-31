class AddScoreToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :score, :string
    add_column :organizations, :stars, :string
    add_column :organizations, :cause_image, :string
  end
end
