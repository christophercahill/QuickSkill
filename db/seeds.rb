# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.delete_all

Topic.create! name: "Culinary"
Topic.create! name: "Finance/Accounting"
Topic.create! name: "Languages" 
Topic.create! name: "General Engineering" 
Topic.create! name: "Music/Art" 
Topic.create! name: "Recreational"
Topic.create! name: "Software Engineering"
Topic.create! name: "Tutoring (High School)"
Topic.create! name: "Tutoring (University)"
Topic.create! name: "Vocational Skills"
Topic.create! name: "Web Development"
Topic.create! name: "Other — Occupational"

