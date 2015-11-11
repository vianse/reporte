class CreateAccesos < ActiveRecord::Migration
  def change
    create_table :accesos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :app_id

      t.timestamps null: false
    end
  end
end
