class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :issue, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
