class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.string :name
      t.decimal :latitude, :precision => 15
      t.decimal :longitude, :precision => 15

      t.timestamps
    end
  end
end
