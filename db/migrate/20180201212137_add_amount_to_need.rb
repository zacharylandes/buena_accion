class AddAmountToNeed < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :amount, :integer
  end
end
