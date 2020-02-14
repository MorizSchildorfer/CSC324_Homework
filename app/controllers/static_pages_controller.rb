require 'image_controller'

class StaticPagesController < ApplicationController
  def home
	@image_loc = ImageGen.gen()
  end

  def help
  end  

  def about
  end
end
