class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
      t.string :abiertas
      t.string :facturadas
      t.string :internas
      t.string :dias
      t.string :app_id

      t.timestamps null: false
    end
  end
end
