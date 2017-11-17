class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    portfolio = Portfolio.find_by(id: params[:portfolio_id])
    comment = Comment.new(portfolio_id: portfolio.id,
                    user_id: @current_user.id,
                    content: params[:msg])
    if comment.save
      render json: {code: 1, message: "success", data: comment}
    else
      render json: {code: 2, message: "fails"}
    end
  end
end
