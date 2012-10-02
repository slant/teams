class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :room_id

      t.timestamps
    end

    add_index :rooms, :room_id
  end
end
