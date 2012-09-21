class CreateFeatureTeams < ActiveRecord::Migration
  def change
    create_table :feature_teams do |t|
      t.string :name
      t.string :slug
      t.string :branch
      t.references :room

      t.timestamps
    end
    add_index :feature_teams, :room_id
  end
end
