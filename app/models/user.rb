class User < ActiveRecord::Base
   attr_accessible :name, :email

   validates :name, :presence => :true
   validates :email, :presence => :true, :uniqueness => :true

   has_many :contact_shares
   has_many :contacts
   has_many :shared_contacts, :through => :contact_shares, :source => :contact
   has_many :groups
   has_many :comments
end
