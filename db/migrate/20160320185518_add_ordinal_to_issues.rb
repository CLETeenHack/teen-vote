class AddOrdinalToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ordinal, :integer
  end
end
