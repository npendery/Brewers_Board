# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

User.create!(username: "ddiggler", city: "Somerville, MA", email: "ddiggler@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "joe_smith", city: "Weston, MA", email: "joe_smith@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "npendery", city: "Cambridge, MA", email: "npendery@gmail.com", password: 12345678, password_confirmation: 12345678, admin: true)
User.create!(username: "bpendery", city: "Cambridge, MA", email: "bpendery@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "dpendery", city: "Cambridge, MA", email: "dpendery@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
user2 = User.create!(username: "mkaiel", city: "Cambridge, MA", email: "mkaiel1@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "jsimenas", city: "Cambridge, MA", email: "jsimenas@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
user1 = User.create!(username: "alex_p", city: "Southie, MA", email: "alex_p@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "kels_b", city: "Southie, MA", email: "kels_b@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
user5 = User.create!(username: "jaime_john", city: "Boston, MA", email: "jaime_john@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
user4 = User.create!(username: "sah_rahman", city: "Washington, DC", email: "sah_rahman@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "tim_boate", city: "Baltimore, MD", email: "tim_boate@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
User.create!(username: "sean_lys", city: "Catonsville, MD", email: "sean_lys@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)
user3 = User.create!(username: "ol_shep_4", city: "Abingdon, MD", email: "ol_shep_4@gmail.com", password: 12345678, password_confirmation: 12345678, admin: false)

g1 = Group.create!(name: "Boston Beer Boys", description: "Making great beer since 2009", location: "Boston, MA", owner: user1)
g2 = Group.create!(name: "AlterEgo Brewing", description: "Bringing out the wort of us", location: "Cambridge, MA", owner: user2)
g3 = Group.create!(name: "E.A.Poe Brewers", description: "Baltimore's best homebrewing club", location: "Baltimore, MD", owner: user3)
g4 = Group.create!(name: "Nations Finest", description: "Homebrewing in the nation's capital at its finest!", location: "Washington, DC", owner: user4)
g5 = Group.create!(name: "Lager Lovers", description: "We love lagers and so should you!\nWe only brew delicious lagers because they are worth the two month wait!", location: "Washington, DC", owner: user5)

Event.create!(title: "Brewing this weekend!", description: "Making a Pale Ale at Bill's house", street: "50 Charles Ave", city: "Boston", state: "MA", date: "2015/10/15", time: "3:00pm", user: user1, group: g1)
Event.create!(title: "Trying our latest batch", description: "Tasting the Apricot Ale at Tim's house", street: "130 Fairway Dr", city: "Cambrdige", state: "MA", date: "2015/08/10", time: "3:00pm", user: user2, group: g2)
Event.create!(title: "Trying the Pumpkin Ale!", description: "Popping open our pumpkin ale just in time for Halloween!", street: "1234 Mass Ave", city: "Cambrdige", state: "MA", date: "2015/10/28", time: "9:00pm", user: user1, group: g1)
Event.create!(title: "Brewing this weekend!", description: "First time attempting a British Bitter", street: "100 Summer St", city: "Catonsville", state: "MD", date: "2015/10/30", time: "11:00am", user: user3, group: g3)
Event.create!(title: "Brewing at Sahils!", description: "Making a Belgian Blone Ale", street: "50 D St", city: "Washington", state: "DC", date: "2015/10/10", time: "1:00pm", user: user4, group: g4)
