class AddWillBeEighteenToVoters < ActiveRecord::Migration
  def change
    remove_column :votes, :will_be_eighteen
    add_column :voters, :will_be_eighteen, :boolean
  end
end
