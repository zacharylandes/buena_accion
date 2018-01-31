class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :state
      t.string :city
      t.integer :zipcode
      t.string :address

      t.timestamps
    end
  end
end
