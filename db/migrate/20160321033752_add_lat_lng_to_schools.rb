class AddLatLngToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :latitude, :string
    add_column :schools, :longitude, :string
  end
end
