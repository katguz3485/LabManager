# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Chemical.search(params[:q])
    @chemicals = @q.result(distinct: true)
=begin
    @items_total = @q.result(distinct: true).where(estimate: false)
                       .sum(:chemical_name)
=end
  end


end
