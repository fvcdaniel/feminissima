class Product < ActiveRecord::Base
  # attr_accessible :title, ::body
  attr_accessible :name, :description, :available_on, :deleted_at, :permalink, :meta_description
  attr_accessible :meta_keywords, :count_on_hand, :image_url, :cover_image, :title, :color, :tamanho
  attr_accessible :price, :discount, :color_id, :tamanho_id, :categoria_id, :gallery_id

  image_accessor :cover_image

  belongs_to :color
  belongs_to :tamanho
  belongs_to :categoria
  has_many :albums
  has_one :gallery

  validates_presence_of :name, :title, :price, :categoria, :cover_image

end
