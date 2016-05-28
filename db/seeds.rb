require 'faker'

CategoryProduct.delete_all
Category.delete_all
OrdersProduct.delete_all
Product.delete_all
Order.delete_all
User.delete_all

10.times do
	Category.create(name: Faker::Commerce.department, description: Faker::Commerce.department)
end

30.times do
	Product.create(
		name: Faker::Commerce.product_name,
		description: Faker::Hipster.sentence(10, false, 20),
		photo: ["http://baconeering.com/wp-content/uploads/2016/02/bacon-heart.jpg",
						"http://twistcatering.com/wp-content/uploads/2013/09/steak-bbq.jpg",
						"http://cdn.shopify.com/s/files/1/0873/8278/products/4_1024x1024.jpg"].sample,
		price: Faker::Commerce.price,
		qty_in_stock: [0,1,2,3,4,5,6,7,8,9,10].sample
	)
end

Product.all.each do |product|
	product.categories << Category.all.sample
end

20.times do
	Product.all.sample.categories << Category.all.sample
end



User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', utype: 'admin')
User.create(username: 'tom', email: 'tom@tom.com', password: 'tomtom', utype: 'user')

10.times do
	User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: '123')
end

15.times do
	Order.create(user_id: User.all.sample.id)
end

# Make sure each order has at least one item
Order.all.each do |order|
	product = Product.all.sample
	order.orders_products << OrdersProduct.create(product_id: product.id, unit_price: product.price, qty: 1 + rand(5))
end

# Add more products to orders
45.times do
	product = Product.all.sample
	OrdersProduct.create(product_id: product.id, order_id: Order.all.sample.id, unit_price: product.price, qty: 1 + rand(5))
end




