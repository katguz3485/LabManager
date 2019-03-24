# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chemical
  before_action :set_category, only: [:create, :edit, :update, :delete]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def show
    @items = @chemical.items
  end

  def new
    @item = @chemical.items.build
  end

  def create
    @item = @chemical.items.build(item_params)
    if @item.save
      redirect_to category_chemical_path(@chemical.category_id, @chemical), notice: I18n.t('shared.created', resource: 'Items')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

  def update
    if @item.update(item_params)
      redirect_to category_chemical_path(@chemical.category_id, @chemical), notice: t('shared.updated', resource: 'Item')
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to category_chemical_path(@chemical.category_id, @chemical), notice: I18n.t('shared.deleted', resource: 'Item')
  end

  private

  def set_chemical
    @chemical = Chemical.find(params[:chemical_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_item
    @item = @chemical.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_owner,
                                 :quantity,
                                 :amount,
                                 :comment,
                                 :daily_usage,
                                 :room,
                                 :shelf,
                                 :number, :chemical_id)
  end
end
