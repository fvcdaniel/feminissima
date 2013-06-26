class Image < ActiveRecord::Base
  # attr_accessible :title, :body 
  #attr_accessor :url_file_name
  attr_accessible :picture, :name

  validates :picture, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture

  belongs_to :gallery
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
