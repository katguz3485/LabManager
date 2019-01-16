# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show;
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def edit;
  end

  def update
    if @category.update
      redirect to category_path
    else
      flash.now.alert = I18n.t('shared.')
    end
  end

  def delete
    @category.destroy
    redirect_to categories_path, notice: I18n.t('shared.deleted', resource: 'Category')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end


end
