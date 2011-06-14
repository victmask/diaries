class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'entries', :notice => "Signed up and Logged in!"
    else
      render "new"
    end
  end
end
