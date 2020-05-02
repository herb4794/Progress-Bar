class CategoriesController < ProductsController
    before_action :get_category, only: [:products]
    before_action :get_products, only: [:index, :products]
    before_action :create_pagination, only: [:index, :products]

    def products

    end

    def get_products
        # TODO: tmp
        @products = @category.products
    end

    def get_category
        @category = Category.find_by_id(params[:category_id])
    end
end
