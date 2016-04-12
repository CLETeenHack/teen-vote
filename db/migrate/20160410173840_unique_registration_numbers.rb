class UniqueRegistrationNumbers < ActiveRecord::Migration
  def change
    add_index :voters, :registration_number, unique: true
  end
end
