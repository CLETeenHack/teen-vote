class CreateIssueLinks < ActiveRecord::Migration
  def change
    create_table :issue_links do |t|
      t.references :issue, index: true, foreign_key: true
      t.string :href, limit: 500
      t.string :title
      t.string :image_url, limit: 500
      t.string :description, limit: 500

      t.timestamps null: false
    end
  end
end
