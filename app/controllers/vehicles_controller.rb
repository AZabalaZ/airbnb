class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.where(take: false)
    if params[:vehicle_type].present?
      @vehicles = @vehicles.where(vehicle_type: params[:vehicle_type])
    end
    if params[:query].present?
      sql_subquery = <<~SQL
      brand @@ :query
      OR model @@ :query
      OR ubication @@ :query
      SQL
      @vehicles = @vehicles.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  # GET /vehicles/1
  def show
    @vehicle = set_vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = set_vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
  end

  def my_vehicles
    @vehicles = current_user.vehicles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :year, :color, :mileage, :vehicle_type, :description, :name, :ubication, :photo)
  end
end
