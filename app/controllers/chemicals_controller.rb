class ChemicalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:new, :edit, :update, :delete]
  before_action :set_chemical, only: [:show, :edit, :update, :destroy]

  def index
    @q = Chemical.ransack(params[:q])
    @chemicals = @q.result(distinct: true)
  end

  def show;
  end

  def new
    @chemical = @category.chemicals.build
  end

  def create
    @chemical = @category.chemicals.build(chemical_params)
    if @chemical.save
      redirect_to chemicals_path, notice: I18n.t('shared.created', resource: 'Chemical')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

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
    #@category = Category.includes(:chemicals).find(params[:category_id])
    #@dam = Dam.includes(:fish_counts, :fish).find(params[:dam_id])
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
                                     :category_id)
  end

end
