class Api::V1::PortfoliosController < ApplicationController
  before_action :authenticate_request!
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def index

  end

end
