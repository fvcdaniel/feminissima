class Album < ActiveRecord::Base
  attr_accessible :name, :cover_image_uid, :capa, :product, :product_id, :cover_image
  image_accessor :cover_image

  belongs_to :product
  
end
