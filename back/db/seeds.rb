# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.delete_all

10.times do |i|
  Task.create(
    name: "task No.#{i}",
    description: "This is task No.#{i}",
    completed: false
  )
end

User.create(
  email: 'test@example.com',
  password: 'xxxxxxxx',
  password_confirmation: 'xxxxxxxx'
)

Group.create(
	name: "私立恵比寿中学"
)
group = Group.find_by(name: "私立恵比寿中学")

ebi = ["真山りか", "安本彩花", "星名美玲", "柏木ひなた", "小林歌穂", "中山莉子"]

ebi.each do |e|
  Idol.create(
    name: e,
		group_id: group.id
  )
end
