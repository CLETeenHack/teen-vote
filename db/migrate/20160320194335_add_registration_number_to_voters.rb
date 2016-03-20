class AddRegistrationNumberToVoters < ActiveRecord::Migration
  def change
    remove_reference :voters, :registration_number, index: true
    add_column :voters, :registration_number, :string
  end
end
