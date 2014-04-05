class AdminsController < ApplicationController
  def new
    @admin = User.new
  end

  def create
    @admin = admin_from_params
    if @admin.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def admin_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.admin = true
    end
  end
end
