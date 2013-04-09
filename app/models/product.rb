class Product < ActiveRecord::Base
  before_save :set_position

  attr_accessible :amount, :creation_date_est, :creation_date_eng, 
  	:description_est, :description_eng, :measurement_est, :measurement_eng, 
  	:price, :image, :image_hover, :position, :title_est, :title_eng

  validates :title_eng, presence: :true, uniqueness: :true
  validates :title_est, presence: :true, uniqueness: :true
  validates :title_eng, presence: :true, uniqueness: :true
  validates :image, presence: :true, uniqueness: :true
  validates :price, numericality: :true

  mount_uploader :image, ImageUploader
  mount_uploader :image_hover, ImageHoverUploader

  protected

  def set_position
    self.position ||= 1 + (Product.where('id=?',id).maximum(:position) || 0)
  end
end
