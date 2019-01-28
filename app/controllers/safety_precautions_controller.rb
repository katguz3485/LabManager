# frozen_string_literal: true

class SafetyPrecautionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_safety_precaution, only: [:show, :edit, :update, :destroy]
  before_action :set_chemical
  before_action :set_category

  def index
    @safety_precautions = @chemical.safety_precaution
  end

  def show; end

  def new
    @safety_precaution = @chemical.safety_precaution.build
  end

  def create
    @safety_precaution = @chemical.safety_precaution.build(safety_precaution_params)
    # @safety_precaution = SafetyPrecaution.new(safety_precaution_params)
    if @safety_precaution.save
      redirect_to safety_precautions_path(@safety_precaution), notice: I18n.t('shared.created', resource: 'Hazard and Safety sheet')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit; end

  def update
    if @safety_precaution.update(safety_precaution_params)
      redirect_to safety_precaution(@safety_precaution), notice: t('shared.updated', resource: 'Hazard and Safety sheet')
    else
      render :edit
    end
  end

  def destroy
    @safety_precaution.destroy
    redirect_to safety_precautions_path, notice: I18n.t('shared.deleted', resource: 'Hazard and Safety sheet')
  end

  private

  def set_safety_precaution
    @safety_precaution = @chemical.safety_precaution.find(params[:id])
  end

  def set_chemical
    @chemical = @category.chemicals.find(params[:chemical_id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def safety_precaution_params
    params.require(:safety_precaution).permit(:sds_file, :name_from_sds, :pictogram,
                                              :storage_temperature_range, :signal_word,
                                              :h_codes, :h_statements, :p_codes, :p_statements,
                                              :adr_number, :adr_class, :adr_group)
  end
end
