class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @resource_votes = @user.get_voted Resource
    @publication_votes = @user.get_voted Publication
  end
end