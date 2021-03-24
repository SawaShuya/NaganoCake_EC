# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(
	email: "a@a",
	password: "aaaaaa"

)


Genre.create(
	[
		{
		id: 1,
		name: "ケーキ",
		is_active: true
		},
		{
		id: 2,
		name: "焼き菓子",
		is_active: true
		},
		{
		id: 3,
		name: "キャンディ",
		is_active: true
		}
	]
)
connection = ActiveRecord::Base.connection();
connection.execute("select setval('genres_id_seq',(select max(id) from genres))")

Item.create(
	[
		{
		genre_id: 1,
		name: "チーズケーキ",
		explanation: "自家製ミルクを使用した濃厚な味わい",
		non_taxed_price: 2000,
		item_image: File.open("./app/assets/images/cheese_cake.jpg"),
		is_active: true
		},
		{
		genre_id: 2,
		name: "クッキー",
		explanation: "口触りよし。お土産にもおすすめ",
		non_taxed_price: 1500,
		item_image: File.open("./app/assets/images/cookie.jpg"),
		is_active: true
		},
		{
		genre_id: 3,
		name: "キャンディー",
		explanation: "甘さと酸味のバランスが心地よい",
		non_taxed_price: 1000,
		item_image: File.open("./app/assets/images/candy.jpg"),
		is_active: true
		}
	]

)