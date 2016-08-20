class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @liked = @user.votes
  end
end