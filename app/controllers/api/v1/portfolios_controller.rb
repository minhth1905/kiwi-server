class Api::V1::PortfoliosController < ApplicationController
  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index
    @portfolios = Portfolio.paginate(:page => params[:page],
      :per_page => Settings.per_page)
  end

  def show

    portfolio = Portfolio.find_by(id: params[:id])
    content = portfolio.contents
    owner_id = portfolio.user.id
    owner_name = portfolio.user.full_name
    data = {info: portfolio, content: content, owner_id: owner_id, owner_name: owner_name}

    render json: {code: 1, data: data}
  end

  def create
    portfolio = Portfolio.new(name: params[:info][:name],
      description: params[:info][:description],
      image: params[:info][:image],
      user_id: @current_user.id)

    if portfolio.save
      array = params[:content]

      array.each do |i|
        if i[:type] == "video"
          Content.create(link: i[:url],
            portfolio_id: portfolio.id,
            typee: 1)
        else
          Content.create(link: i[:url],
            portfolio_id: portfolio.id,
            typee: 0)
        end
      end
      render json: {code: 1, message: "Tạo mới thành công"}
    else
      render json: {code: 2, message: "Tạo mới thất bại"}
    end
  end

end
