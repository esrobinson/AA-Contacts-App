class Comment < ActiveRecord::Base
  attr_accessible :user_id, :contact_id, :comment

  validates :user_id, :contact_id, :comment, :presence => :true

  belongs_to :user
  belongs_to :contact

end