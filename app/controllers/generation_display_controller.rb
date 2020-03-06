class GenerationDisplayController < ApplicationController
	def data
		index()
	end
	def index
		@settings = GenerationDatum.all
	end
end
