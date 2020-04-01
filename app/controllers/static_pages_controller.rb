require 'image_controller'

class StaticPagesController < ApplicationController
  def home
	image_generator = ImageController.new()
	width = (params[:width].present?) ? params[:width].to_i : 400
	height = (params[:height].present?) ? params[:height].to_i : 400
	if (params[:seed].present?)
		srand(params[:seed].to_i)
	end
	image_info = image_generator.generateImage(width,height)
	@image_loc = image_info[0]
	@image_mod = image_info[1]
  end

  def help
  end  

  def about
  end
end
