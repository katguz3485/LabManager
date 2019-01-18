# frozen_string_literal: true

class ChemicalsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_chemical, only: [:show, :edit, :update, :destroy]

  def index
    @chemicals = Chemical.all
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

  def update
    if @chemical.update(chemical_params)
      redirect_to chemical_path(@chemical), notice: t('shared.updated', resource: 'Chemical')
    else
      render :edit
    end
  end

  def destroy
    @chemical.destroy
    redirect_to chemicals_path, notice: I18n.t('shared.deleted', resource: 'Chemical')
  end

  private

  def set_chemical
    @chemical = Chemical.find(params[:id])
  end

  def chemical_params
    params.require(:chemical).permit(:chemical_name, :formula, :molecular_weight, :density, :cas_number, :canonical_smiles, :inchi_key, :user_id, :formula_picture)
  end
end
