class RemoveRegistrationNumbers < ActiveRecord::Migration
  def change
    drop_table :registration_numbers
  end
end
