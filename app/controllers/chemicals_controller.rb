# frozen_string_literal: true

class ChemicalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_chemical, only: [:show, :edit, :update, :destroy]


  def index
    @chemicals = @category.chemicals
  end

  def show;

  end

  def new
    @chemical = @category.chemicals.build
  end

  def create
    @chemical = @category.chemicals.build(chemical_params)
    if @chemical.save
      redirect_to category_path(@category), notice: I18n.t('shared.created', resource: 'Chemical')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

  def update
    if @chemical.update(chemical_params)
      redirect_to category_path(@category), notice: t('shared.updated', resource: 'Chemical')
    else
      render :edit
    end
  end

  def destroy
    @chemical.destroy
    redirect_to category_path(@category), notice: I18n.t('shared.deleted', resource: 'Chemical')
  end

  private

  def set_chemical
    @chemical = @category.chemicals.find(params[:id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end


  def chemical_params
    params.require(:chemical).permit(:chemical_name,
                                     :formula,
                                     :molecular_weight,
                                     :density,
                                     :cas_number,
                                     :canonical_smiles,
                                     :inchi_key,
                                     :formula_picture, :category_id)
  end

end
