class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :subdomain

      t.timestamps
    end
  end
end
