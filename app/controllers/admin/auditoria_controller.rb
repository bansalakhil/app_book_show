class Admin::AuditoriaController < ApplicationController
  # GET /auditoria
  # GET /auditoria.json
  
  before_filter :authorize_admin, :find_theatre
  before_filter :find_auditorium, :except => [:index, :create, :new]

  def index
    @auditoria = @theatre.auditoria.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auditoria }
    end
  end

  # GET /auditoria/1
  # GET /auditoria/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auditorium }
    end
  end

  # GET /auditoria/new
  # GET /auditoria/new.json
  def new
    @auditorium = @theatre.auditoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auditorium }
    end
  end

  # GET /auditoria/1/edit
  def edit
  end

  # POST /auditoria
  # POST /auditoria.json
  def create
    @auditorium = @theatre.auditoria.new(params[:auditorium])

    respond_to do |format|
      if @auditorium.save
        format.html { redirect_to [:admin, @theatre, @auditorium], notice: 'Auditorium was successfully created.' }
        format.json { render json: @auditorium, status: :created, location: @auditorium }
      else
        format.html { render action: "new" }
        format.json { render json: @auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /auditoria/1
  # PUT /auditoria/1.json
  def update   
    respond_to do |format|
      if @auditorium.update_attributes(params[:auditorium])
        format.html { redirect_to [:admin, @theatre, @auditorium], notice: 'Auditorium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auditoria/1
  # DELETE /auditoria/1.json
  def destroy
    begin
      @auditorium.destroy
    rescue
      flash[:notice] = "Auditorium could not be destroyed."
    else
      flash[:notice] = "Auditorium successfully destroyed."
    end

    respond_to do |format|
      format.html { redirect_to admin_theatre_auditoria_url(@theatre) }
      format.json { head :no_content }
    end
  end

  private

  def find_theatre
    begin 
      @theatre = Theatre.find(params[:theatre_id])
    rescue
      redirect_to admin_cities_url, notice: "Please select a city"
    end
  end

  def find_auditorium
    begin
      @auditorium = @theatre.auditoria.find(params[:id])
    rescue
      redirect_to admin_theatre_auditoria_url(@theatre), notice: "Auditorium not found."
    end
  end
end
