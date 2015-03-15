# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)¥
Product.create(name: 'りんご', local: Local.create(name: '世田谷'))
Product.create(name: 'みかん', local: Local.create(name: '杉並'))
