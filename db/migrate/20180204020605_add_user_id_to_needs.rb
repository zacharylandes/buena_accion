class AddUserIdToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_reference :needs, :user, foreign_key: true
  end
end
