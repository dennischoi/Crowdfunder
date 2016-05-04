# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({
  name: "Natalie",
  email:"natalie@natalie.com",
  password: "1234",
  password_confirmation: "1234"
})

user2 = User.create({
  name: "Fred",
  email:"fred@nfred.com",
  password: "1234",
  password_confirmation: "1234"
})

project1 = Project.create({
  owner_id: User.find_by(name: "Natalie").id,
  name: "Fred's not here",
  description: "So good",
  end_date: Date.today,
  funding_goal: 1000,
  media_url: "www.hello.com"
  })

reward1 = Reward.create({
  name: "Level one",
  description: "basic level",
  amount: 10,
  project_id: Project.find_by( name: "Fred's not here").id
})

pledge = Pledge.create({
  backer_id: User.find_by( name: "Fred").id,
  reward_id: Reward.find_by( name: "Level one").id
})
