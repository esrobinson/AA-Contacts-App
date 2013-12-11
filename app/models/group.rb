class Group < ActiveRecord::Base
  attr_accessible :name, :user_id
  validates :name, :user_id, :presence => :true

  belongs_to :user

  has_many :group_members
  has_many :contacts, :through => :group_members, :source => :contact


end