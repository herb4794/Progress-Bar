class SubcategoriesController < ApplicationController
    before_action :get_category, only: [:products]
    before_action :get_subcategory, only: [:products]

    def products
    end

    def get_category
    end

    def get_subcategory
    end
end
