class AddGalleryIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :gallery_id, :integer
  	add_index :products, :gallery_id
  end
end
