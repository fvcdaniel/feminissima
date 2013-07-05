#encoding=UTF-8
class AddInitialMenu < ActiveRecord::Migration
  def up
  	Menu.create(:name => 'Menu Principal')
  	Menu.create(:name => 'Jóias')
  end

  def down
  	Menu.where(:name => 'Menu Principal').first.destroy
  	Menu.where(:name => 'Jóias').first.destroy
  end
end
