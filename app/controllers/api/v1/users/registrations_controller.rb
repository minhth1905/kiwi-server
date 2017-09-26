class Api::V1::Users::RegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    # if User.find_by_username(user_params[:username]) ||
    #   User.find_by_email(user_params[:email])
    #   render json: {:code => 2, message: t("devise.registrations.username")}
    #   return
    # end
    if User.find_by_email(user_params[:email])
      render json: {:code => 2, message: t("devise.registrations.username")}
      return
    end
    user = User.new(user_params)
    if user.save
      render json: {code: 1, message: t("devise.registrations.signed_up_but_unconfirmed")},
        status: 200
    else
      render json: {:code => 2, :message => user.errors.full_messages[0]}
    end
  end

  private
  def user_params
    params.require(:user).permit :first_name, :last_name, :email, :password
  end
end
