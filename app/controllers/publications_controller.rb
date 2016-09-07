class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :save_original_path, only: [:like]
  before_action :require_signin!, only: [:like]
  after_action :clear_original_path, only: [:like]
  respond_to :html, :js
  
  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all.order(:cached_votes_up => :desc)
    @publication_weeks = @publications.group_by { |t| t.created_at.beginning_of_week}
    @categories = {
      "Design Leadership"=>"design-leadership",
      "Graphic Design"=>"graphic-design",
      "Inspiration"=>"inspiration",
      "Interaction Design"=>"interaction-design",
      "Process"=>"process",
      "Thinking"=>"thinking",
      "User Research"=>"user-research",
    }
    if params[:tag]
      @publications = Publication.tagged_with(params[:tag])
    else
      @publications = Publication.all
    end
  end

  def like
    @publication = Publication.find(params[:id])
    @publication.liked_by current_user
    respond_to do |format|
      if session[:return_to] != nil
        format.html { redirect_to(publications_path) }
      end
        format.html
        format.js
    end
  end

  def unlike
    @publication = Publication.find(params[:id])
    @publication.unliked_by current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to action: :index, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to action: :index, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def save_original_path
      session[:return_to] = request.fullpath
    end

    def clear_original_path
      session[:return_to] = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :author, :description, :category, :medium, :url, :tag_list)
    end
end
