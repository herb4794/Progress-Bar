class CategoriesController < ApplicationController
    before_action :get_category, only: [:products]

    LIMITED_PRODUCTS_NUMBER = 20

    def products
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

        @categories = Category.all

        # TODO: tmp
        @products = @category.products

        @first_page = 1
        count = @products.count

        @last_page = (count / LIMITED_PRODUCTS_NUMBER)
        if count % LIMITED_PRODUCTS_NUMBER
        @last_page  += 1
        end
        
        @products = @products.offset((@page - 1) *
        LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
    end

    def get_category
        @category = Category.find_by_id(params[:category_id])
    end
end
