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

  def save_file_with_token dir, file
    begin
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      extn = File.extname file.original_filename
      name = File.basename(file.original_filename, extn).gsub(/[^A-z0-9]/, "_")
      full_name = name + "_" + SecureRandom.hex(10) + extn
      full_name = full_name.last(100) if full_name.length > 100
      path = File.join(dir, full_name)
      File.open(path, "wb") { |f| f.write file.read }
      return full_name
    rescue
      return nil
    end
  end
end
