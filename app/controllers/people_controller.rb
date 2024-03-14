class PeopleController < ApplicationController
  
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.valid?
        checkgroupexists(@person.groupname, @person)        
        @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.valid?
        @person.update(person_params)
        @person.save!
        checkgroupexists(person_params["groupname"], @person) 
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    file = params[:file]
    return redirect_to people_path, notice: "CSV Files Only" unless file.content_type == "text/csv"
    import_service = CsvImportPeopleService.new

    theimport = import_service.importfile(file, method(:checkgroupexists))
    msg = ''
    theimport.each do |k, v|
      if !k.instance_of?(String)
        msg = msg + 'row - ' + k.to_s 
        msg = msg + ' has error ' + v.join(' ')
      else
        msg = msg + k 
        msg = msg + ' ' + v.to_s
      end
      msg = msg + '<br/>'
    end
    redirect_to people_path, notice: "import results .. <br/> #{msg}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:firstname, :lastname, :groupname, :role)
    end

    def checkgroupexists (groupname, person)
      eventgroup = Eventgroup.find_or_create_by(name: groupname)
      person.eventgroups << eventgroup
    end
end
