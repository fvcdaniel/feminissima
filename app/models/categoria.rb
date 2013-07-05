class Categoria < ActiveRecord::Base
  
  attr_accessible :name, :categoria_id, :menu_id
  
  belongs_to :menu
  belongs_to :categoria

  has_many :categorias

  validates_presence_of :menu_id
  
end
