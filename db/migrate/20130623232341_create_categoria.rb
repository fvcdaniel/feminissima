class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :name
      t.belongs_to :categoria

      t.timestamps
    end
    add_index :categoria, :categoria_id
  end
end
