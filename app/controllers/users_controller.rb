class UsersController < ApplicationController
  def show
    @user = User.find_by_nickname(params[:id])
    @resource_votes = @user.get_voted Resource
    @resources = @resource_votes.all.order(:cached_votes_up => :desc)
    @categories = {
      "User Research"=>"user-research",
      "Typography"=>"typography",
      "Color Palette"=>"color-palette",
      "Iconography"=>"iconography",
      "Stock Photos"=>"stock-photos",
      "Inspiration"=>"inspiration",
      "Prototyping"=>"prototyping",
      "Presentation"=>"presentation",
      "Collaboration"=>"collaboration",
    }
  end

end
