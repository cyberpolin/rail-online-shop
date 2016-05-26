require 'faker'

CategoryProduct.delete_all
Category.delete_all
Product.delete_all
User.delete_all

10.times do
	Category.create(name: Faker::Commerce.department)
end

30.times do
	Product.create(name: Faker::Commerce.product_name, description: Faker::Hipster.sentence(10, false, 20),
		photo: "https://images3.alphacoders.com/658/658610.jpg", price: Faker::Commerce.price)
end

Product.all.each do |product|
	product.categories << Category.all.sample
end

20.times do 
	Product.all.sample.categories << Category.all.sample
end

User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', utype: 'admin')
User.create(username: 'tom', email: 'tom@tom.com', password: 'tomtom', utype: 'user')


	

