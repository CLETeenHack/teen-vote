class CreateRegistrationNumbers < ActiveRecord::Migration
  def change
    create_table :registration_numbers do |t|
      t.string :number
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
