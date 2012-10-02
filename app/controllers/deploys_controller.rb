class DeploysController < ApplicationController
  # GET /deploys
  # GET /deploys.json
  def index
    @deploys = Deploy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deploys }
    end
  end

  # GET /deploys/1
  # GET /deploys/1.json
  def show
    @deploy = Deploy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deploy }
    end
  end

  # GET /deploys/1/edit
  def edit
    @deploy = Deploy.find(params[:id])
  end

  # POST /deploys
  # POST /deploys.json
  def create
    test_params = { user: 148845, room: 'itriage_bot_test', repository: 'itriage3' }

    @member = Member.where(hipchat_id: params[:user]).first
    @deploy = Deploy.new(params[:deploy])

    respond_to do |format|
      if @deploy.save
        result = @deploy.perform!
        #format.json { render json: @deploy, status: :created, location: @deploy }
        format.json { render json: result, status: :created, location: @deploy }
      else
        format.json { render json: @deploy.errors, status: :unprocessable_entity }
      end
    end
  end
end
