require 'sinatra'
require 'sendgrid-ruby'
include SendGrid

get "/" do 
	class Product
		attr_accessor :productName, :roastPic
		def initialize(productName, roastPic)
			@productName = productName
			@roastPic = roastPic
		end
		
	
	end

	@o1 = Product.new("Dark Cocoa", "https://upload.wikimedia.org/wikipedia/commons/8/8c/Coffee_Beans_closeup.jpg")
	@o2 = Product.new("Amazonia", "https://www.iguaria.com/wp-content/uploads/2014/09/graos-de-cafe-torrados.jpg")
	@o3 = Product.new("Pamela Anderson", "https://zionroasters.com/wp-content/uploads/2016/01/brazil1_dkroast_400.jpg")
	@o4 = Product.new("Fulton Roast", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx8oALuBWcFKhTT3ZUmr-vpvMHYmEWVxvtbpyYPqfoJhP0wdq1")
	@o5 = Product.new("Fulton Supreme", "https://images.fineartamerica.com/images-medium-large-5/medium-dark-roast-kona-coffee-beans-philip-rosenberg.jpg")
	

	erb :home
end


get "/products" do
	class Coffee
		attr_accessor :productName, :price, :description, :roastPic, :url
		def initialize(productName, price, description, roastPic, url)
			@productName = productName
			@price = price
			@description = description
			@roastPic = roastPic
			@url = url
		end
		
	
	end

	@c1 = Coffee.new("Dark Cocoa","$4.00/lb", 'A light bodied flavor with hints of dark chocolate', "https://upload.wikimedia.org/wikipedia/commons/8/8c/Coffee_Beans_closeup.jpg", 'https://thefuturegadgets.com/wp-content/uploads/2018/10/Global-Coffee-Roasters-Market.jpg')
	@c2 = Coffee.new("Amazonia","$5.00/lb", 'A light & citrus tasting roast, perfect for cold brew',"https://www.iguaria.com/wp-content/uploads/2014/09/graos-de-cafe-torrados.jpg", '//cdn.shopify.com/s/files/1/0056/4562/t/12/assets/homepage_b_left1.jpg?1407122…')
	@c3 = Coffee.new("Pamela Anderson","$3.00/lb", 'Our blonde roast is light and fluffy, our best selling roast by far', "https://zionroasters.com/wp-content/uploads/2016/01/brazil1_dkroast_400.jpg", '//cdn.shopify.com/s/files/1/0056/4562/t/12/assets/homepage_b_right1.jpg?1407122…')
	@c4 = Coffee.new("Fulton Roast","$6.00/lb", 'The Fultons roast is our most popular roast, made by slow roasting the beans over a chesnut fire for over 20 hours', "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx8oALuBWcFKhTT3ZUmr-vpvMHYmEWVxvtbpyYPqfoJhP0wdq1", 'https://cdn.shopify.com/s/files/1/1781/4225/files/coffee-beans-on-burlap_1200x.jpg?v=1535638437')
	@c5 = Coffee.new("Fulton Supreme","$8.00/lb", 'Our darkest roast, the Fulton Supreme is a heavy roast with tons of flavor and color', "https://images.fineartamerica.com/images-medium-large-5/medium-dark-roast-kona-coffee-beans-philip-rosenberg.jpg", 'http://www.mycitylife.com.au/ImageGen.ashx?image=/media/22798/nathan-dumlao-290152.jpg&Width=800&Height=530&Align=center&Crop=Resize')
	

	@b1 = Coffee.new("French Vanilla","$3.00", 'Reminiscent of Parisian nights, this cold brew is cold and full of pick-pockets', "https://woodscoffee.com/wp-content/uploads/2017/04/woods-coffee-cold-brew-pint-glass.jpg", 'https://thefuturegadgets.com/wp-content/uploads/2018/10/Global-Coffee-Roasters-Market.jpg')
	@b2 = Coffee.new("Pumpkin Spice","$3.00", 'Like, "Oh My God" Amy! This is flipping amazing!', "https://woodscoffee.com/wp-content/uploads/2017/04/woods-coffee-cold-brew-pint-glass.jpg", 'https://thefuturegadgets.com/wp-content/uploads/2018/10/Global-Coffee-Roasters-Market.jpg')
	@b3 = Coffee.new("Irish Cream","$3.00", "Irish you\'d buy this every day!","https://woodscoffee.com/wp-content/uploads/2017/04/woods-coffee-cold-brew-pint-glass.jpg", 'https://thefuturegadgets.com/wp-content/uploads/2018/10/Global-Coffee-Roasters-Market.jpg')

	erb :products
end




get "/about" do
	class Images
		attr_accessor :fileName, :url 
		def initialize(fileName, url)
			@fileName = fileName
			@url = url
		end
		
	end

	@i1 = Images.new("Dark Cocoa", 'https://thefuturegadgets.com/wp-content/uploads/2018/10/Global-Coffee-Roasters-Market.jpg')
	@i2 = Images.new("Amazonia", 'https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg')
	@i3 = Images.new("Pamela Anderson", 'https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg')
	@i4 = Images.new("Fulton Roast", 'https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg')
	@i5 = Images.new("Fulton Supreme", 'https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg')
	

	erb :about
end


get "/search" do
	@search_term = params[:search_term]
	erb :search
end


get '/login' do
	username = params[:username]
	password = params[:password]
	if password == '1234' && username == "ogidan"
		redirect '/search'
		else
		erb :home
		end

end

get "/contact" do
	erb :contact
end

post "/contact" do
	from = Email.new(email: params[:email])
	to = Email.new(email: 'andrewgfulton@gmail.com')
	subject = params[:subject]
	content = Content.new(type: 'text/plain', value: params[:body])
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers

	redirect "/"

end

get "/products" do
	erb :products
end
