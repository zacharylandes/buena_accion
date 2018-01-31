class AddLattoorg < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :lat, :integer
    add_column :organizations, :long,  :integer
  end
end
