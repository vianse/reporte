class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :telefono
      t.string :mensaje
      t.string :url
      t.string :respuesta
      t.string :comentario
      t.string :app_id
      t.string :group_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
