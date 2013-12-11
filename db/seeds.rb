# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!( { name: "eric", email: "email" } )
User.create!( { name: "not eric", email: "not email" } )

Contact.create!( { name: "contact1", email: "email1", user_id: 1, favorite: true } )
Contact.create!( { name: "contact2", email: "email2", user_id: 1, favorite: false } )
Contact.create!( { name: "contact3", email: "email3", user_id: 2, favorite: false } )

ContactShare.create!( { user_id: 1, contact_id: 3, favorite: true})
ContactShare.create!( { user_id: 2, contact_id: 1, favorite: false})

Group.create!( { user_id: 1, name: "Group" } )

GroupMember.create!( { contact_id:  1, group_id: 1})