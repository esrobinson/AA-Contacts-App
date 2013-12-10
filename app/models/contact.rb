class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id

  validates :name, :email, :presence => true
  validates :user_id, :presence => true, :uniqueness => true

  has_many :contact_shares
  belongs_to :user
end