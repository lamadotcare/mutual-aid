class ServiceAreasController < ApplicationController
  before_action :set_service_area, only: [:show, :edit, :update, :destroy]

  def index
    @service_areas = ServiceArea.all
  end

  def show
  end

  def new
    location_data = Location.new
    @service_area = ServiceArea.new
    @service_area.location_data = location_data
  end

  def edit
  end

  def create
    @service_area = ServiceArea.new(service_area_params)

    respond_to do |format|
      if @service_area.save
        format.html { redirect_to service_areas_path, notice: 'ServiceArea was successfully created.' }
        format.json { render :show, status: :created, location: @service_area }
      else
        format.html { render :new }
        format.json { render json: @service_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service_area.update(service_area_params)
        format.html { redirect_to service_areas_path, notice: 'ServiceArea was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_area }
      else
        format.html { render :edit }
        format.json { render json: @service_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service_area.destroy
    respond_to do |format|
      format.html { redirect_to service_areas_url, notice: 'ServiceArea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_service_area
      @service_area = ServiceArea.find(params[:id])
    end

    def service_area_params
      params.require(:service_area).permit(
          :parent_id,
          :organization_id,
          :service_area_type,
          :name,
          :description,
          location_data_attributes: [ :id,
                                      :locationable_type,
                                      :locationable_id,
                                      :street_address,
                                      :city,
                                      :state,
                                      :zip,
                                      :county,
                                      :region,
                                      :neighborhood,
                                      :_destroy ],
          service_areas_attributes: [ :id,
                                      :parent_id,
                                      :organization_id,
                                      :service_area_type,
                                      :name,
                                      :description,
                                      :_destroy ]
      )
    end
end
