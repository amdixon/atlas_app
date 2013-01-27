class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :city_id
      t.integer :favorite_id

      t.timestamps
    end
  end
end
