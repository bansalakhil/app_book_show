class Admin::ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  before_filter :authorize_admin, :find_auditorium
  before_filter :find_show, :except => [:index, :new, :create]

  def index
    @shows = @auditorium.shows.order(:on_date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shows }
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = @auditorium.shows.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = @auditorium.shows.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to [:admin, @auditorium, @show], notice: 'Show was successfully created.' }
        format.json { render json: @show, status: :created, location: @show }
      else
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    respond_to do |format|  
      if @show.update_attributes(params[:show])
        format.html { redirect_to [:admin, @auditorium, @show], notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    begin
      @show.destroy
    rescue
      flash[:notice] = "Show could not be destroyed."
    else
      flash[:notice] = "Show successfully destroyed."
    end

    respond_to do |format|
      format.html { redirect_to admin_auditorium_shows_url(@auditorium) }
      format.json { head :no_content }
    end
  end

  private

  def find_auditorium
    begin
      @auditorium = Auditorium.find(params[:auditorium_id]) 
    rescue
      redirect_to admin_cities_url, :notice => 'Please select a city.'
    end
  end

  def find_show
    begin
      @show = @auditorium.shows.find(params[:id])
    rescue
      redirect_to admin_auditorium_shows_url(@auditorium), :notice => "Show not found."
    end
  end
end
