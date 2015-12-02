class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|
      t.string :mes
      t.string :año
      t.decimal :objetivo_real
      t.decimal :objetivo_obligado
      t.string :app_id
      t.string :user_id
      t.string :group_id
      t.string :tipo

      t.timestamps null: false
    end
  end
end
