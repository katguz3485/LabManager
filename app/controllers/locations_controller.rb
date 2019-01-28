# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_item
  before_action :set_chemical
  before_action :set_category

  def index
    @location = @item.locations
  end

  def show; end

  def new
    @location = @item.locations.build
  end

  def create
    @location = @item.locations.build(location_params)
    if @location.save
      redirect_to locations_path(@location), notice: I18n.t('shared.created', resource: 'Hazard and Safety sheet')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit; end

  def update
    if @location.update(safety_precaution_params)
      redirect_to locations_path(@location), notice: t('shared.updated', resource: 'Hazard and Safety sheet')
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: I18n.t('shared.deleted', resource: 'Hazard and Safety sheet')
  end

  private

  def set_location
    @location = item.locations.find(params[:id])
  end

  def set_item
    @item = @chemical.items.find(params[:item_id])
  end

  def set_chemical
    @chemical = @category.chemicals.find(params[:chemical_id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def location_params
    params.require(:item).permit(:room,
                                 :shelf,
                                 :number)
  end
end
