class AssociateVoterToRegistrationNumber < ActiveRecord::Migration
  def change
    remove_column :voters, :registration_number
  end
end
