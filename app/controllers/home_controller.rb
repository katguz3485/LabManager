# frozen_string_literal: true

class HomeController < ApplicationController

  before_action :authenticate_user!


  def index
    @q= Category.search(params[:q])
    @categories = @q.result
    @q = Chemical.search(params[:q])
    @chemicals = @q.result(distinct: true)
  end



end
