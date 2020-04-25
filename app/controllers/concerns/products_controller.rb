class ProductsController < ApplicationController
    before_action :redirect_to_root_if_not_log_in, except: [:index, :show]


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

        @categories = Category.all

        @products = Product.all

        @first_page = 1
        count = @products.count

        @last_page = (count / LIMITED_PRODUCTS_NUMBER)
        if count % LIMITED_PRODUCTS_NUMBER
        @last_page  += 1
        end

        @products = @products.offset((@page - 1) *
        LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
    end

    def show
        @product = Product.find_by_id(params[:id])
    end

    def new

        @product = Product.new
    end

    def create 
        image = params[:product][:image]
        if image
        image_url = save_file(image)
        end

        product = Product.create(product_permit.merge({image_url: image_url}))

        flash[:notice] = "建立成功"
        redirect_to action: :new

    end

    def edit
        @product = Product.find_by_id(params[:id])
        if @product.blank?
            redirect_to action: :index
            return
        end
    end

    def update
        product = Product.find(params[:id])

        image = params[:product][:image]
        if image
            image_url = save_file(image)
            product.update(product_permit.merge({image_url: image_url}))
        else
            product.update(product_permit)
        end

        flash[:notice] = "更新成功"
        redirect_to action: :edit
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy 

        redirect_to action: :index
        
    end

    # def test_after_action
    #     flash[:note] = "after"
    # end

    def product_permit
        params.require(:product).permit([:name, :description, :price, :subcategory_id])
    end

    def redirect_to_root_if_not_log_in
        if !current_user
        flash[:notice] = "你尚未登入"
        redirect_to root_path
        return
        end
    end

    def save_file(newFile)
        dir_url = Rails.root.join('public', 'uploads/products')

        FileUtils.mkdir_p(dir_url) unless File.directory?(dir_url)    

        file_url = dir_url + newFile.original_filename

        File.open(file_url, 'w+b') do |file|
            file.write(newFile.read)
        end

        return "/uploads/products/" + newFile.original_filename
    end
end
