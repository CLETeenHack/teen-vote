class AddNationalStateToIssueTypes < ActiveRecord::Migration
  def change
    add_column :issue_types, :national, :boolean
    add_column :issue_types, :state, :boolean
  end
end
