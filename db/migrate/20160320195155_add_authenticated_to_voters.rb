class AddAuthenticatedToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :authenticated, :boolean
  end
end
