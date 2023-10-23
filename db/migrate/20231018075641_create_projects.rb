class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :years, null: false
      t.string :href, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :projects, :href, unique: true
    add_index :projects, :name, unique: true
  end
end
