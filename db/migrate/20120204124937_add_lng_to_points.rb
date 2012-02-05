class AddLngToPoints < ActiveRecord::Migration
  def change
    add_column :points, :lng, :double
  end
end
