class CreateAccesos < ActiveRecord::Migration
  def change
    create_table :accesos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :group_id
      t.string :app_id_s
      t.string :app_id_h
      t.timestamps null: false
    end
  end
end
