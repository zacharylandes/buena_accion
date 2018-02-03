class CreateCategoryNeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :category_needs do |t|
      t.references :category, foreign_key: true
      t.references :need, foreign_key: true
    end
  end
end
