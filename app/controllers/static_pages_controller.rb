require 'image_controller'

class StaticPagesController < ApplicationController
  def home
	image_info = ImageGen.gen()
	@image_loc = image_info[0]
	@image_mod = image_info[1]
  end

  def help
  end  

  def about
  end
end
