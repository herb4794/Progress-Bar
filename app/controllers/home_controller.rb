class HomeController < ApplicationController    
    PRODUCTS_COUNT = 100
    LIMITED_PRODUCTS_NUMBER = 20

    def index
        @ad = { 
            title: "大型廣告",
            des: "這是廣告!!!",
            action_title: "閱讀更多",
         }

         if params[:page]
             @page = params[:page].to_i
         else
            @page = 1
        end
         @first_page = 1
         @last_page = (PRODUCTS_COUNT / LIMITED_PRODUCTS_NUMBER)

         @products = []
         (1..PRODUCTS_COUNT).each do |index|
            product = { 
                id: index,
                name: "有機果汁#{index}",
                description: "鮮味橙汁",
                image_url: "https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
             }
             @products << product
            end

            @products = @products[(@page - 1) * LIMITED_PRODUCTS_NUMBER, LIMITED_PRODUCTS_NUMBER ]
    end
end
