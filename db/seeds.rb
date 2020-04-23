# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
    name: "Progressbar TW",
    email: "herb4794@gmail.com",
    password: "4794",
    is_admin: true,
)

categories = [
    {
    "name": "3C",
    "subcatgories": [
    "電腦",
    "手機",
    "家電",
    "相機",
    ]
}, 
{
    "name": "美食",
    "subcatgories": [
    "飲品",
    "零食",
    "泡麵",
    "麵包",
    ]
}
]

categories.each do |c_data|
category = Category.create(name: c_data[:name])
c_data[:subcatgories].each do |s_data_name|
    subcategory = Subcategory.create(name: s_data_name, category: category)
end
end


subcategory = Subcategory.all[4]
PRODUCTS_COUNT = 40

(1..PRODUCTS_COUNT).each do |index|
product = {
    name: "柳橙汁",
    description: "好喝柳橙汁",
    image_url: "https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?h=350&auto=compress&cs=tinysrgb",
    subcategory: subcategory
}

Product.create(product)
end
