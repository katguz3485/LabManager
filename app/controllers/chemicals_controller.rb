# frozen_string_literal: true

class ChemicalsController < ApplicationController
  before_action :set_chemical, only: [:show, :edit, :update, :destroy]

  def index
    @chemicals = Chemical.all.decorate
  end

  def show; end

  def new
    @chemical = Chemical.new
  end

  def create
    @chemical = Chemical.new(chemical_params)
    if @chemical.save
      redirect_to chemical_path(@chemical), notice: I18n.t('shared.created', resource: 'Chemical')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit; end

  def destroy
    @chemical.destroy
    redirect_to chemicals_path, notice: I18n.t('shared.deleted', resource: 'Chemical')
  end

  private

  def set_chemical
    @chemical = Chemical.find(params[:id])
  end

  def chemical_params
    params.require(:chemical).permit(:name, :formula, :molecular_weight, :density, :cas_number, :csid, :smiles, :inchi, :image)
  end
end
