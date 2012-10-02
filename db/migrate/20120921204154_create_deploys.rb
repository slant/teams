class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.string :branch
      t.string :environment
      t.string :sha
      t.string :commit_message
      t.references :feature_team
      t.references :member
      t.references :repository
      t.references :server

      t.timestamps
    end
    add_index :deploys, :feature_team_id
    add_index :deploys, :member_id
    add_index :deploys, :repository_id
    add_index :deploys, :server_id
  end
end
