require 'image_controller'

class StaticPagesController < ApplicationController
  def home
	image_generator = ImageController.new()
	image_info = image_generator.generateImage(400,400)
	@image_loc = image_info[0]
	@image_mod = image_info[1]
  end

  def help
  end  

  def about
  end
end
