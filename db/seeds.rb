# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SkillCategory.create([
  {name:'Webサイト',en_name: 'website'},
  {name:'EC・ネットショップ',en_name: 'e-commerce'},
  {name:'ブログ',en_name: 'blog'},
  {name:'Webマーケティング',en_name: 'web-marketing'},
  {name:'SNSマーケティング',en_name: 'sns-marketing'},
  {name:'動画',en_name: 'movie'},
])

Skill.create([
  {name:'Wordpress',en_name: 'wordpress',skill_category_id:1},
  #後からfindbyの書き方に変える
  {name:'Wix',en_name: 'wix',skill_category_id:1},
  {name:'shopify',en_name: 'shopify',skill_category_id:2},
])
#後から既に入っているファイルを作らないようにする

AdminUser.create!(email: Rails.application.credentials.admin[:email], password: Rails.application.credentials.admin[:password], password_confirmation: Rails.application.credentials.admin[:password])