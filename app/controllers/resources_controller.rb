class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :save_original_path, only: [:like]
  before_action :require_signin!, only: [:like]
  after_action :clear_original_path, only: [:like]
  respond_to :html, :js

  # GET /resources
  # GET /resources.json

  def index
    @resources = Resource.all.order(:cached_votes_up => :desc)
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

      @new_resources = Resource.where(created_at: (Time.now - 30.day)..Time.now).sample(3)

      @job =  HTTParty.get("https://api.seeker.company/v1/jobs/random", :headers => { "Authorization" => "Token #{ENV["seeker_key"]}" })
      print "hellojk"
      print @job
      if @job['detail'] != "Not found."
        @job_title = @job['job_title']
        @job_description = @job['job_description']
        @job_location = @job['job_location']
        @job_application_link = @job['job_application_link']
        @creation_date = @job['creation_date']
        @job_link = @job['job_link']
        @company_name = @job['company']['name']
        @company_url = @job['company']['company_url']
      end
  end

  def like
    @resource = Resource.find(params[:id])
    @resource.liked_by current_user
    respond_to do |format|
      if session[:return_to] != nil
        format.html { redirect_to(resources_path) }
      end
        format.html
        format.js
    end
  end

  def unlike
    @resource = Resource.find(params[:id])
    @resource.unliked_by current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to action: :index, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to action: :index, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def save_original_path
      session[:return_to] = request.fullpath
    end

    def clear_original_path
      session[:return_to] = nil
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :category, :description, :url)
    end
end
