class ArchivedStatusesController < ApplicationController
  before_action :set_archived_status, only: [:show, :edit, :update, :destroy]

  # GET /archived_statuses
  # GET /archived_statuses.json
  def index
    @archived_statuses = ArchivedStatus.all
  end

  # GET /archived_statuses/1
  # GET /archived_statuses/1.json
  def show
  end

  # GET /archived_statuses/new
  def new
    @archived_status = ArchivedStatus.new
  end

  # GET /archived_statuses/1/edit
  def edit
  end

  # POST /archived_statuses
  # POST /archived_statuses.json
  def create
    @archived_status = ArchivedStatus.new(archived_status_params)

    respond_to do |format|
      if @archived_status.save
        format.html { redirect_to @archived_status, notice: 'Archived status was successfully created.' }
        format.json { render :show, status: :created, location: @archived_status }
      else
        format.html { render :new }
        format.json { render json: @archived_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archived_statuses/1
  # PATCH/PUT /archived_statuses/1.json
  def update
    respond_to do |format|
      if @archived_status.update(archived_status_params)
        format.html { redirect_to @archived_status, notice: 'Archived status was successfully updated.' }
        format.json { render :show, status: :ok, location: @archived_status }
      else
        format.html { render :edit }
        format.json { render json: @archived_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archived_statuses/1
  # DELETE /archived_statuses/1.json
  def destroy
    @archived_status.destroy
    respond_to do |format|
      format.html { redirect_to archived_statuses_url, notice: 'Archived status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archived_status
      @archived_status = ArchivedStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archived_status_params
      params.require(:archived_status).permit(:druid, :datastream, :process, :status, :error_msg, :error_txt, :datetime, :attempts, :lifecycle, :elapsed, :repository, :archive_dt, :version, :note, :priority, :lane_id)
    end
end
