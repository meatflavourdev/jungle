class Admin::CategoriesController < ApplicationController
  before_filter :authentication_check

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category Created'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  private
  def authentication_check
   authenticate_or_request_with_http_basic do |user, password|
    user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
   end
  end

end
