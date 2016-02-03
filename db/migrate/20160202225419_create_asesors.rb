class CreateAsesors < ActiveRecord::Migration
  def change
    create_table :asesors do |t|
      t.string :nombre
      t.string :asesor_id
      t.string :user_id
      t.string :app_id

      t.timestamps null: false
    end
  end
end
