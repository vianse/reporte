class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :name
      t.string :group_id
      t.string :subgroup_id

      t.timestamps null: false
    end
  end
end
