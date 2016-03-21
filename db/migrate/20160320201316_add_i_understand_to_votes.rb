class AddIUnderstandToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :understand_this, :boolean
    add_column :votes, :care_about_this, :boolean
  end
end
