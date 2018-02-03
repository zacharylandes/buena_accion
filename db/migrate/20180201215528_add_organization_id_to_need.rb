class AddOrganizationIdToNeed < ActiveRecord::Migration[5.1]
  def change
    add_reference :needs, :organization, foreign_key: true
  end
end
