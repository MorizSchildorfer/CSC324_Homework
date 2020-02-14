require 'chunky_png'
class ImageGen
	def self.gen()
		filename = 'app/assets/images/filename.png'
           	png = ChunkyPNG::Image.new(32, 32, ChunkyPNG::Color::TRANSPARENT)
		for i in (0..31)
			for j in (0..31)
				grey = mapTo255(i+j, 0, 64)
				png[j,i] = ChunkyPNG::Color.rgba(grey, grey, grey, 255)
			end
		end
		png.save(filename, :interlace => true)
		return 'filename.png'
		
	end

	def self.mapTo255(input, max, min)
		return ((((input.to_f)+min)/(min+max))*255).to_i
	end
end
