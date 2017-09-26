class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception,
    if: Proc.new {|c| c.request.format != "application/json"}
  protect_from_forgery with: :null_session,
    if: Proc.new {|c| c.request.format == "application/json"}

  require "jsonwebtoken"
  respond_to :json, if: Proc.new {|c| c.request.format == "application/json"}

  def authenticate_request!
    token = request.headers['Authorization'].split(' ').last rescue nil
    payload = token.nil? ? nil : JsonWebToken.decode(token) rescue nil
    if payload.nil? || !JsonWebToken.valid_payload(payload.first)
      render json: {code: 0,
        message: "Bạn cần phải đăng nhập trước khi tiếp tục."}, status: 401
      return
    end
    @current_user = User.find_by_id payload.first['user_id']
    @current_user = User.find_by id: payload.first["user_id"]
  end

  def load_user_authentication
    @user = User.find_by email: user_params[:email]
    unless (@user && @user.valid_password?(user_params[:password]))
      render json: {code: 0,
        message: t("devise.failure.not_found_in_database")}, status: 200
    # else
    #   if @user.confirmed_at.nil?
    #     render json: {code: 0,
    #       message: t("devise.registrations.signed_up_but_inactive")}
    #   elsif @user.locked_at.present?
    #     render json: {code: 0,
    #       message: t("devise.registrations.signed_up_but_locked")}
    #   end
    end
  end
end
