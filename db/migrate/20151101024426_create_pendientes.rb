class CreatePendientes < ActiveRecord::Migration
  def change
    create_table :pendientes do |t|
      t.string :orden
      t.string :tipo
      t.decimal :importe
      t.date  :fecha
      t.string :estatus
      t.string :app_id
      t.string :sucursal_id

      t.timestamps null: false
    end
  end
end
