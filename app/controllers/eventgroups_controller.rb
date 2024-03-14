class EventgroupsController < ApplicationController
  before_action :set_eventgroup, only: %i[ show edit update destroy ]

  # GET /eventgroups or /eventgroups.json
  def index
    @eventgroups = Eventgroup.all
  end

  # GET /eventgroups/1 or /eventgroups/1.json
  def show 
    grpname = Eventgroup.find_by_id(params[:id]).name
  end

  # GET /eventgroups/new
  def new
    @eventgroup = Eventgroup.new
  end

  # GET /eventgroups/1/edit
  def edit
  end

  # POST /eventgroups or /eventgroups.json
  def create
    @eventgroup = Eventgroup.new(eventgroup_params)

    respond_to do |format|
      if @eventgroup.save
        format.html { redirect_to eventgroup_url(@eventgroup), notice: "Eventgroup was successfully created." }
        format.json { render :show, status: :created, location: @eventgroup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventgroups/1 or /eventgroups/1.json
  def update
    respond_to do |format|
      if @eventgroup.update(eventgroup_params)
        format.html { redirect_to eventgroup_url(@eventgroup), notice: "Eventgroup was successfully updated." }
        format.json { render :show, status: :ok, location: @eventgroup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventgroups/1 or /eventgroups/1.json
  def destroy
    #raise params.inspect
    @eventgroup.destroy

    respond_to do |format|
      format.html { redirect_to eventgroups_url, notice: "Eventgroup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventgroup
      @eventgroup = Eventgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eventgroup_params
      params.require(:eventgroup).permit(:name)
    end
end
