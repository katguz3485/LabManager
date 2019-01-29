class Chemicals::DownloadsController < ApplicationController

  before_action :set_chemical
  before_action :set_category

  def show
    redirect_to @chemical.formula_picture.file.authenticated_url
  end


  private

  def set_chemical
   @chemical = Chemical.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end