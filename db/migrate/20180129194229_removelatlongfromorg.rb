class Removelatlongfromorg < ActiveRecord::Migration[5.1]
  def change
        remove_column :organizations, :lat
        remove_column :organizations, :long
  end
end
