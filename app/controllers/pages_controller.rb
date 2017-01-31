# frozen_string_literal: true
class PagesController < ApplicationController
  def index
    @carousel = Carousel.find_by(name: 'home')
  end
end
