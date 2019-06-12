class UsersController < ApplicationController

  # GET /users/new
  def new
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    if user.save
      sessions[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
