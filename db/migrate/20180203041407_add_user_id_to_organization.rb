class AddUserIdToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_reference :organizations, :user, foreign_key: true
  end
end
