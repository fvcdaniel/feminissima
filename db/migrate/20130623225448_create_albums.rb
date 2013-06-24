class CreateAlbums < ActiveRecord::Migration
  def up
  	create_table :albums do |t|
      t.string :cover_image_uid
      t.string :name
      t.boolean :capa
      t.belongs_to :product

      t.timestamps
    end
    add_index :albums, :product_id
  end

  def down
  	drop_table :albums
  end
end
