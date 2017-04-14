# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tag1 = TagTopic.create('tag' => 'news')
tag2 = TagTopic.create('tag' => 'music')
tag3 = TagTopic.create('tag' => 'sports')

tagging1 = Tagging.create(:tag_id => tag1.id, :shortened_url_id => 1)
tagging2 = Tagging.create(:tag_id => tag1.id, :shortened_url_id => 2)
tagging3 = Tagging.create(:tag_id => tag2.id, :shortened_url_id => 1)
tagging4 = Tagging.create(:tag_id => tag2.id, :shortened_url_id => 3)
tagging5 = Tagging.create(:tag_id => tag3.id, :shortened_url_id => 1)
tagging6 = Tagging.create(:tag_id => tag3.id, :shortened_url_id => 4)
tagging7 = Tagging.create(:tag_id => tag3.id, :shortened_url_id => 3)
