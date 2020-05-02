class CategoriesController < ProductsController
    before_action :get_category, only: [:products]
    before_action :get_products, only: [:products]
    before_action :create_pagination, only: [:products]

    def products
    end

    private

    def get_products
        @products = @category.products
    end

    def get_category
        @category = Category.find_by_id(params[:category_id])
    end
end
