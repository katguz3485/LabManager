# frozen_string_literal: true

class ChemicalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:new, :create, :show, :edit, :update, :delete]
  before_action :set_chemical, only: [:show, :edit, :update, :destroy]

  def index
    @q = Chemical.ransack(params[:q])
    @chemicals = @q.result(distinct: true)
  end

  def show
    @items = @chemical.items
    @items_total = @chemical.items.count
    @safety_precaution = @chemical.safety_precaution
  end

  def new
    @chemical = Chemical.new
    @categories = Category.all.map { |c| [c.category_name, c.id] }
  end

  def create
    @chemical = Chemical.new(chemical_params)
    if @chemical.cas_number.present?
      cid = ChemicalServices::PubChemServiceCid.new(cas: @chemical.cas_number).call
      ChemicalServices::PubChemServiceProperty.new.call(cid, @chemical)
      redirect_to chemicals_path, notice: I18n.t('shared.created', resource: 'Chemical')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit; end

  def update
    if @chemical.update(chemical_params)
      redirect_to chemicals_path, notice: t('shared.updated', resource: 'Chemical')
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

  def set_category
    @category = Category.find(params[:category_id])
  end

  def chemical_params
    params.require(:chemical).permit(:chemical_name,
                                     :formula,
                                     :molecular_weight,
                                     :density,
                                     :cas_number,
                                     :canonical_smiles,
                                     :inchi_key,
                                     :formula_picture,
                                     :cid,
                                     :category_id)
  end
end
