class Categoria < ActiveRecord::Base
  belongs_to :categoria
  attr_accessible :name, :categoria_id
end
