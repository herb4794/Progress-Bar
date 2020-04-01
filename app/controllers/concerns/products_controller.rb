class ProductsController < ApplicationController
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

        @products = Product.all

        @first_page = 1
        @last_page = (@products.count / LIMITED_PRODUCTS_NUMBER)

        @products = @products.offset((@page - 1) * 
        LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
    end

    def new
    end

    def create
    end
    
end