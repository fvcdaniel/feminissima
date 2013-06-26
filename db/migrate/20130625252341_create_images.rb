class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :name, :string
      t.references :gallery
      t.timestamps
    end
  end
end
