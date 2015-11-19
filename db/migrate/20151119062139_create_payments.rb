class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :app_id
      t.string :importe
      t.date :fecha
      t.string :dias
      t.string :estatus

      t.timestamps null: false
    end
  end
end
