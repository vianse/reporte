class CreateCrms < ActiveRecord::Migration
  def change
    create_table :crms do |t|
      t.string :orden
      t.string :app_id
      t.string :sucursal_id
      t.string :group_id
      t.string :asesor_id
      t.string :fecha
      t.string :fecha_salida
      t.string :key
      t.string :mes
      t.string :año
      t.string :tipo
      t.integer :dias
      t.string :cliente
      t.string :telefono
      t.string :verificacion

      t.timestamps null: false
    end
  end
end
