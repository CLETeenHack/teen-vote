class ChangeUniqueKeyToRegistrationNumber < ActiveRecord::Migration
  def change
    rename_column :voters, :unique_key, :registration_number
    add_reference :voters, :registration_number, index: true
  end
end
