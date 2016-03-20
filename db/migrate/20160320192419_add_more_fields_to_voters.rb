class AddMoreFieldsToVoters < ActiveRecord::Migration
  def change
    add_reference :voters, :school
    add_column :voters, :gender, :string
    add_column :voters, :school_year, :string
  end
end
