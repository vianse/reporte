class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :api_key
      t.string :group_id
      t.string :type_app
      t.string :subgroup_id
      t.timestamps null: false
    end
  end
end
