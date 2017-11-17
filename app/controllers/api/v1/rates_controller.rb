class Api::V1::RatesController < ApplicationController
  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    portfolio = Portfolio.find_by(id: params[:portfolio_id])
    rate = Rate.new(portfolio_id: params[:portfolio_id],
                    user_id: @current_user.id, number: params[:star],
                    description: params[:msg])
    if rate.save
      render json: {code: 1, message: "success", data: rate}
    else
      render json: {code: 2, message: "fails"}
    end
  end
end
