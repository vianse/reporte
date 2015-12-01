class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :app_id
      t.string :esquema
      t.decimal :importe
      t.date :fechapago
      t.date :fechavencimiento
      t.string :diasalerta
      t.string :diascorteacceso
      t.string :estatus

      t.timestamps null: false
    end
  end
end
