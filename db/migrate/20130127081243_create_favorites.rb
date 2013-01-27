class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :country
      t.integer :city_id
      t.integer :position

      t.timestamps
    end
  end
end
