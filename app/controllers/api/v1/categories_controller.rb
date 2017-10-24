class Api::V1::CategoriesController < ApplicationController

  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index
  end

  def show
    category = Category.find_by(id: params[:id])

    if category.present?
      render json: {code: 1, message: "success", data: category}
    else
      render json: {code: 1, message: "fail"}
    end

  end

  def create
    category = Category.new category_params
    if category.save
      render json: {code: 1, message: "Tạo mới thành công", data: category}
    else
      render json: {code: 1, message: "Tạo mới không thành công", data: category}
    end
  end

  private

  def category_params
    params.permit :name, :description, :image
  end
end
