class AddMenuIdToCategoria < ActiveRecord::Migration
  def change
    add_column :categoria, :menu_id, :integer
    add_index :categoria, :menu_id
  end
end
