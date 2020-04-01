class GenerationDataController < ApplicationController
	def data
		index()
	end
	def index
		@settings = GenerationDatum.all
	end
	def new
		@datum = GenerationDatum.new
	end
	def create
    		@datum = GenerationDatum.new(datum_params)    # Not the final implementation!
    		if @datum.save
      			redirect_to data_path
    		else
		      render 'new'
		end
	end
	private
    		def datum_params
      			params.require(:generation_datum).permit(:seed, :width, :height,
                                   :river_length)
    		end
end
