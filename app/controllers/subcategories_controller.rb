class SubcategoriesController < ProductsController
    before_action :get_category, only: [:products]
    before_action :get_subcategory, only: [:products]
    before_action :get_products, only: [:products]
    before_action :create_pagination, only: [:products]

    def products

    end

    private

    def get_category
        @category = Category.find_by(params[:category_id])
    end

    def get_subcategory
        @subcategory = Subcategory.find_by(params[:subcategory_id])
        if(@subcategory.category != @category)
            redirect_to products_category_path(@category)
        end
    end

    def get_products
        @products = @subcategory.products
    end
end
