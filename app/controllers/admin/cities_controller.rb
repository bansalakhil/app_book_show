class Admin::CitiesController < ApplicationController
  # GET /cities
  # GET /cities.json
  before_filter :authorize_admin
  before_filter :find_city, :except => [:index, :new, :create]

  def index
    @cities = City.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.json
  def new
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to [:admin, @city], notice: 'City was successfully created.' }
        format.json { render json: @city, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to [:admin, @city], notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    begin
      @city.destroy
    rescue
      flash[:notice] = "City could not be destroyed."
    else
      flash[:notice] = "City successfully destroyed."
    end

    respond_to do |format|
      format.html { redirect_to admin_cities_url }
      format.json { head :no_content }
    end
  end

  def find_city
    begin
      @city = City.find(params[:id])
    rescue
      redirect_to admin_cities_url, :notice => "City not found."
    end
  end
end
