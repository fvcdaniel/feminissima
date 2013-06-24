class CreateTamanhos < ActiveRecord::Migration
  def change
    create_table :tamanhos do |t|
      t.string :name

      t.timestamps
    end
  end
end
