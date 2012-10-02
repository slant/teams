class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :feature_team
      t.references :member

      t.timestamps
    end
    add_index :memberships, :feature_team_id
    add_index :memberships, :member_id
  end
end
