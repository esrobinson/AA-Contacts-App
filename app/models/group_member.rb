class GroupMember < ActiveRecord::Base
  attr_accessible :group_id, :contact_id
  validates :group_id, :contact_id, :presence => :true

  belongs_to :contact

  belongs_to :group
end
