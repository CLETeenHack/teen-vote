class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :issue_type_id
      t.references :issue_type, index:true, foreign_key: true
      t.datetime :voting_open_time
      t.datetime :voting_closed_time

      t.timestamps null: false
    end
  end
end
