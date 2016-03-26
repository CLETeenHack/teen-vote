class AddWillBeEighteenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :will_be_eighteen, :boolean
  end
end
