class AddLatToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lat, :double
  end
end
