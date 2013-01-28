class AddProfileIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :profile_id, :integer
  end
end
