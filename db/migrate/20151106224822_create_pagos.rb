class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.string :app_id
      t.string :mes
      t.string :año

      t.timestamps null: false
    end
  end
end
