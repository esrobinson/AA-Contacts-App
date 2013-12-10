class ContactShare < ActiveRecord::Base
  attr_accessible :user_id, :contact_id

  validates :user_id, :contact_id, :presence => true

  belongs_to :contact
  belongs_to :user
end