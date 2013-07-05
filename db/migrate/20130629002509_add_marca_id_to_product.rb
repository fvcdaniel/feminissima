class AddMarcaIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :marca_id, :integer
    add_index :products, :marca_id
  end
end
