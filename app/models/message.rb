class Message
	include ActiveAttr::Model
  
	attribute :name
  attribute :email
  attribute :telefon
  attribute :address
  attribute :order

  attr_accessible :address, :email, :name, :order, :telefon

  validates :name, presence: :true
  validates :email, presence: :true
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_length_of :order, :maximum => 500
end
