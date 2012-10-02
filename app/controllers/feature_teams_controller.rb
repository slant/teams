class FeatureTeamsController < ApplicationController
  before_filter :available_servers

  # GET /feature_teams
  # GET /feature_teams.json
  def index
    @feature_teams = FeatureTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feature_teams }
    end
  end

  # GET /feature_teams/1
  # GET /feature_teams/1.json
  def show
    @feature_team = FeatureTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature_team }
    end
  end

  # GET /feature_teams/new
  # GET /feature_teams/new.json
  def new
    @feature_team = FeatureTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature_team }
    end
  end

  # GET /feature_teams/1/edit
  def edit
    @feature_team = FeatureTeam.find(params[:id])
  end

  # POST /feature_teams
  # POST /feature_teams.json
  def create
    @feature_team = FeatureTeam.new(params[:feature_team])

    respond_to do |format|
      if @feature_team.save
        format.html { redirect_to @feature_team, notice: 'Feature team was successfully created.' }
        format.json { render json: @feature_team, status: :created, location: @feature_team }
      else
        format.html { render action: "new" }
        format.json { render json: @feature_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feature_teams/1
  # PUT /feature_teams/1.json
  def update
    @feature_team = FeatureTeam.find(params[:id])

    respond_to do |format|
      if @feature_team.update_attributes(params[:feature_team])
        format.html { redirect_to @feature_team, notice: 'Feature team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feature_teams/1
  # DELETE /feature_teams/1.json
  def destroy
    @feature_team = FeatureTeam.find(params[:id])
    @feature_team.destroy

    respond_to do |format|
      format.html { redirect_to feature_teams_url }
      format.json { head :no_content }
    end
  end


  private

    def available_servers
      @available_servers = Server.available
    end
end
