class Gallery < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :product, :images_attributes, :product_id
  validates :product_id, presence: true, uniqueness: true
  belongs_to :product
  has_many :images
  accepts_nested_attributes_for :images


  def name
  	"Galeria do Produto - #{self.product.name}"
  end

end
