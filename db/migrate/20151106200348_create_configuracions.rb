class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
      t.string :internas
      t.string :dias
      t.string :app_id
      t.string :group_id
      t.string :tipo

      t.timestamps null: false
    end
  end
end
