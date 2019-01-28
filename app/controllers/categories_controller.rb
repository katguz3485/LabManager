# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @q= Category.search(params[:q])
    @categories = @q.result.includes(:chemicals)
  end

  def show;

  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

  def update
    if @category.update(category_params)
      redirect to categories_path
    else
      flash.now.alert = I18n.t('shared.updated')
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: I18n.t('shared.deleted', resource: 'Category')
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :id)
  end

  def set_category
    @category = Category.find(params[:id])
  end


end
