class StoreController < ApplicationController
  include CurrentCart

  skip_before_action :authorize
  before_action :set_cart
  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end

    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
