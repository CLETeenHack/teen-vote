class AddPartyToChoice < ActiveRecord::Migration
  def change
        add_column :choices, :party, :string, limit: 30
  end
end
