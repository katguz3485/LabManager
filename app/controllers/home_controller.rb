# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    @chemicals = Chemical.all
  end
end
