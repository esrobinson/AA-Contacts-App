class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id, :favorite

  validates :name, :email, :presence => true
  validates :user_id, :presence => true

  has_many :contact_shares
  has_many :comments
  belongs_to :user

  def self.contacts_for_user_id(user_id)
    # Contact.find_by_sql([<<-SQL, user_id, user_id])
    #   SELECT
    #     contacts.*
    #   FROM
    #     contacts
    #   LEFT OUTER JOIN
    #     contact_shares ON contacts.id = contact_shares.contact_id
    #   WHERE
    #     contacts.user_id = ? OR contact_shares.user_id = ?
    # SQL

    Contact.includes(:contact_shares).where(
      "contacts.user_id = ? OR contact_shares.user_id = ?",
      user_id,
      user_id
    )

  end

  def self.favorites_for_user_id(user_id)
    Contact.find_by_sql([<<-SQL, user_id, user_id])
      SELECT
        contacts.*
      FROM
        contacts
      LEFT OUTER JOIN
        contact_shares ON contacts.id = contact_shares.contact_id
      WHERE
        (contacts.user_id = ? AND contacts.favorite = 't')
         OR (contact_shares.user_id = ? AND contact_shares.favorite = 't')
    SQL
  end

end