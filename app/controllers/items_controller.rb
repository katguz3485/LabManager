# frozen_string_literal: true

class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_chemical
  before_action :set_category

  def index
    @item = @chemical.items
  end

  def show;
  end

  def new
    @item = @chemical.items.build
  end

  def create
    @item = @chemical.items.build(item_params)
    if @item.save
      redirect_to items_path(@item), notice: I18n.t('shared.created', resource: 'Hazard and Safety sheet')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

  def update
    if @item.update(safety_precaution_params)
      redirect_to items_path(@item), notice: t('shared.updated', resource: 'Hazard and Safety sheet')
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: I18n.t('shared.deleted', resource: 'Hazard and Safety sheet')
  end

  private

  def set_item
    @item = @chemical.items.find(params[:id])
  end

  def set_chemical
    @chemical = @category.chemicals.find(params[:chemical_id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end



  def item_params
    params.require(:item).permit(:item_owner,
                                 :quantity,
                                 :amount,
                                 :comment,
                                 :daily_usage)
  end

end




