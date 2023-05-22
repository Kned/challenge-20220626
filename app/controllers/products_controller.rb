class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products
  def index
    @products = Product.page(params[:page]).per(params[:per_page])

    render json: {
      page: @products.current_page,
      per_page: @products.limit_value,
      total_pages: @products.total_pages,
      total: Product.count,
      last_page: @products.last_page?,
      products: @products
    }
  end

  # GET /products/1
  def show
    render json: @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.where(code: params[:code]).first
    end

end
