class Api::V1::Users::ConfirmationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    if params[:email].present?
      user = User.find_by email: params[:email]
      if user.present?
        user.send_confirmation_instructions
        render json: {code: 1, message: t("common.confirmation_instruction2")}
      else
        render json: {code: 2, message: t("common.no_email")}
      end
    else
      user = User.find_by id: params[:user]
      if user.confirmation_token == params[:confirmation_token]
        if user.confirmed_at.present?
          render json: {code: 2, message: t("errors.messages.already_confirmed")}
        else
          auth_token = JsonWebToken.encode(user_id: user.id)
          user.update_attributes(confirmed_at: Time.now)
          render json: {code: 1, message: t("devise.confirmations.confirmed"),
            user: @user, token: auth_token}
        end
      else
        render json: {code: 2, message: t("common.confirmation_instruction3")}
      end
    end
  end
end
