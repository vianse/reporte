class CreateAppadmins < ActiveRecord::Migration
  def change
    create_table :appadmins do |t|
      t.string :app_id
      t.string :group_id
      t.string :admin_id

      t.timestamps null: false
    end
  end
end
