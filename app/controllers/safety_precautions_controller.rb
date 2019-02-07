class SafetyPrecautionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chemical, only: [:new, :show, :edit, :update, :destroy, ]

  before_action :set_safety_precaution, only: [:show, :edit, :update, :destroy]

  def index
    @safety_precautions = SafetyPrecaution.includes(:chemical).all
    @q = SafetyPrecaution.ransack(params[:q])
    @safety_precautions  = @q.result.includes(:chemical)
  end

  def show
    @safety_precaution = @chemical.safety_precaution
  end

  def new

    @safety_precaution = @chemical.build_safety_precaution

  end

  def create
    @safety_precaution = @chemical.build_safety_precaution(safety_precaution_params)
    if @safety_precaution.save
      redirect_to chemical_safety_precaution_path(@chemical, @safety_precaution), notice: I18n.t('shared.created', resource: 'Hazard and Safety sheet')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit; end

  def update
    if @safety_precaution.update(safety_precaution_params)
      redirect_to chemical_safety_precaution_path(@chemical, @safety_precaution), notice: t('shared.updated', resource: 'Hazard and Safety sheet')
    else
      render :edit
    end
  end

  def destroy
    @safety_precaution.destroy
    redirect_to chemical_safety_precaution_path(@chemical, @safety_precaution), notice: I18n.t('shared.deleted', resource: 'Hazard and Safety sheet')
  end

  private

  def set_chemical
    @chemical = Chemical.find(params[:chemical_id])
  end

  def set_safety_precaution
    @safety_precaution = SafetyPrecaution.find(params[:id])
  end

  def safety_precaution_params
    params.require(:safety_precaution).permit(:sds_file, :name_from_sds, :pictogram,
                                              :storage_temperature_range, :signal_word,
                                              :h_codes, :h_statements, :p_codes, :p_statements,
                                              :adr_number, :adr_class, :adr_group, :chemical_id, :id)
  end
end