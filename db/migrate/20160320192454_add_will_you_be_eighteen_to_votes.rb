class AddWillYouBeEighteenToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :will_be_eighteen, :boolean
  end
end
