class AddEstoqueToProducts < ActiveRecord::Migration
  def change
    add_column :products, :estoque, :integer
  end
end
