class AddImageUrlToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :image_url, :string, limit: 500
  end
end
