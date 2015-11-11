class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|
      t.string :mes
      t.string :año
      t.string :objetivo_real
      t.string :objetivo_obligado
      t.string :app_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
