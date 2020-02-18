require 'chunky_png'

class ImageGen
	def self.gen()
		r = (1..4).to_a.shuffle.first
           	png = ChunkyPNG::Image.new(400, 400, ChunkyPNG::Color::TRANSPARENT)
		for i in (0..399)
			for j in (0..399)
				#i*j+j*i
				#i*i+j*j
				#i*j+j*j
				#i*j+i*i
				#i*j
				#i+j
				#(mapTo255(i*j+j*i, 0, 255)*r)%255
				grey = (mapTo255(Math.sin(i/(r*Math::PI))+Math.sin(j/(3*r*Math::PI))*Math.cos(j/(0.75*r*Math::PI)), -2, 2))%255
				png[j,i] = ChunkyPNG::Color.rgba(grey, grey, grey, 255)
			end
		end
		return [png.resize(400,400), r]
		
	end

	def self.mapTo255(input, max, min)
		val = ((((input.to_f)-min)/(max-min))*255)
		return val.to_i
	end
end
