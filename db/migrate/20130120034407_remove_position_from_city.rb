class RemovePositionFromCity < ActiveRecord::Migration
  def up
    remove_column :cities, :position
  end

  def down
  end
end
