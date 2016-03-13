class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :unique_key

      t.timestamps null: false
    end
  end
end
