class Api::V1::ImageUploadersController < ApplicationController
  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    if params[:file].respond_to?('read')
      dir = "#{Rails.root}/public/images/"
      new_name = save_file_with_token dir, params[:file]
      render json: {data: "/images/" + new_name, code: 1, message: "success"}
    else
      render json: {code: 2, message: "fails"}
    end
  end
end
