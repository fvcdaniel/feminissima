class Menu < ActiveRecord::Base
  attr_accessible :name
  has_many :categorias
  
end
