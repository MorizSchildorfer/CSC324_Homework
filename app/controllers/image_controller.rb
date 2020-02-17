require 'chunky_png'

class ImageGen
	def self.gen()
		dir = Rails.root.join('tmp').to_s
		r = (1..4).to_a.shuffle.first
		#filename = dir.dup.concat('/image.png')
		#puts filename
           	png = ChunkyPNG::Image.new(32, 32, ChunkyPNG::Color::TRANSPARENT)
		for i in (0..31)
			for j in (0..31)
				grey = mapTo255(i+j, 0, 64)*r
				png[j,i] = ChunkyPNG::Color.rgba(grey, grey, grey, 255)
			end
		end
		# png.save(filename, :interlace => true)
		return [png, r]
		
	end

	def self.mapTo255(input, max, min)
		return ((((input.to_f)+min)/(min+max))*255).to_i
	end
end
