class CategoriesController < ApplicationController
    before_action :get_category, only: [:products]

    def products
    end

    def get_category
    end
end
