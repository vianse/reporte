class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :api_key

      t.timestamps null: false
    end
  end
end
