class Admin::TheatresController < ApplicationController
  # GET /theatres
  # GET /theatres.json
  
  before_filter :authorize_admin, :find_city
  before_filter :find_theatre, :except => [:index, :new, :create]
    
  def index
    @theatres = @city.theatres.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theatres }
    end
  end

  # GET /theatres/1
  # GET /theatres/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theatre }
    end
  end

  # GET /theatres/new
  # GET /theatres/new.json
  def new
    @theatre = @city.theatres.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theatre }
    end
  end

  # GET /theatres/1/edit
  def edit
  end

  # POST /theatres
  # POST /theatres.json
  def create
    @theatre = @city.theatres.new(params[:theatre])

    respond_to do |format|
      if @theatre.save
        format.html { redirect_to [:admin, @city, @theatre], notice: 'Theatre was successfully created.' }
        format.json { render json: @theatre, status: :created, location: @theatre }
      else
        format.html { render action: "new" }
        format.json { render json: @theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theatres/1
  # PUT /theatres/1.json
  def update
    respond_to do |format|
      if @theatre.update_attributes(params[:theatre])
        format.html { redirect_to [:admin, @city, @theatre], notice: 'Theatre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theatres/1
  # DELETE /theatres/1.json
  def destroy
    begin
      @theatre.destroy
    rescue
      flash[:notice] = "Theatre could not be destroyed."
    else
      flash[:notice] = "Theatre successfully destroyed."
    end

    respond_to do |format|
      format.html { redirect_to admin_city_theatres_url(@city) }
      format.json { head :no_content }
    end
  end

  private

  def find_city
    begin
      @city = City.find(params[:city_id])
    rescue
      redirect_to admin_cities_url, notice: "City not found."
    end
  end

  def find_theatre
    begin
      @theatre = @city.theatres.find(params[:id])
    rescue
      redirect_to admin_city_theatres_url(@city), notice: "Theatre not found."
    end
  end

end

