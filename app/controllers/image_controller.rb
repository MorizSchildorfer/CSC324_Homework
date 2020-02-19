require 'chunky_png'

class ImageGen
	def self.gen()
		a= Hash.new(0)
		dim=400
		r = (1..4).to_a.shuffle.first
           	png = ChunkyPNG::Image.new(dim, dim, ChunkyPNG::Color::TRANSPARENT)
		max=min=Math.sin(0/(r*Math::PI))+Math.cos(0/(r*Math::PI))
		for i in (0..(dim-1))
			for j in (0..(dim-1))
				#i*j+j*i
				#i*i+j*j
				#i*j+j*j
				#i*j+i*i
				#i*j
				#i+j
				#(mapTo255(i*j+j*i, 0, 255)*r)%255
				v= Math.sin(i/(r*Math::PI))+Math.cos(j/(2*r*Math::PI))*Math.cos(j/(0.75*r*Math::PI))
				if(v>max) 
					max=v 
				elsif(v<min) 
					min=v 
				end
				a[[j,i]]= v
			end
		end
		for i in (0..(dim-1))
			for j in (0..(dim-1))
				v= a[[j,i]]
				grey = (mapTo255(v, max, min))%255
				colorArr = calcColorGrad(grey)
				png[j,i] = ChunkyPNG::Color.rgba(colorArr[0], colorArr[1], colorArr[2], 255)
			end
		end
		return [png.resize(400,400), r]
		
	end

	def self.mapTo255(input, max, min)
		val = ((((input.to_f)-min)/(max-min))*255)
		return val.to_i
	end
	def self.calcColorGrad(grey)
		arr = Array.new(3)
		if(grey<64)
			arr=[255,grey*4,0]
		elsif(grey<128)
			grey= grey-64
			arr=[255-grey*4,255,0]
		elsif(grey<192)
			grey= grey-128
			arr=[0,255,grey*4]
		else
			grey= grey-192
			arr=[0,255-grey*4,255]
		end
	end
			
end
