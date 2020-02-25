require 'chunky_png'

#i*j+j*i
#i*i+j*j
#i*j+j*j
#i*j+i*i
#i*j
#i+j
#(mapTo255(i*j+j*i, 0, 255)*r)%255

#if(i-j < 5 && -5 < i-j)
#	v=v-0.25*(i-j).abs
#end

class ImageController
        attr_accessor :image_data
        attr_accessor :image_width
        attr_accessor :image_height
        attr_accessor :randomNum

	def initialize()
		@image_data = Hash.new(0)
		@image_width = 0
		@image_height = 0
		@randomNum = 1
	end
	def generateImage(width, height)
		self.randomNum = (1..4).to_a.shuffle.first
		self.image_data = Hash.new(0)
		self.image_width = width
		self.image_height = height
		generateBaseData()
		return transferDataToImage()
	end
	def generateBaseData()
		for row in (0..(image_width-1))
			for column in (0..(image_height-1))
				value= calculateValueAtPixel(row, column)
				image_data[[row,column]]= value
			end
		end
	end

	def calculateMinMaxOfData()
		max=min=image_data[[0,0]]
		for row in (0..(image_width-1))
			for column in (0..(image_height-1))
				value = image_data[[row, column]]
				if(value>max) 
					max=value
				elsif(value<min) 
					min=value
				end
			end
		end
		return min, max
	end
	def transferDataToImage()
		min, max = calculateMinMaxOfData()
           	png = ChunkyPNG::Image.new(image_width, image_height, ChunkyPNG::Color::TRANSPARENT)
		for row in (0..(image_width-1))
			for column in (0..(image_height-1))
				v= image_data[[row,column]]
				grey = (ImageController.mapTo255(v, min, max))%255
				colorArr = ImageController.calcColorGradient(grey)
				png[row,column] = ChunkyPNG::Color.rgba(colorArr[0], colorArr[1], colorArr[2], 255)
			end
		end
		return [png, randomNum]

	end

	def calculateValueAtPixel(row, column)
		output = Math.sin(column/(randomNum*Math::PI))
		output+= Math.cos(row/(2*randomNum*Math::PI))*Math.cos(row/(0.75*randomNum*Math::PI))
		output += calculateValueShiftAtPixel(row, column)
		return output
	end
	def calculateValueShiftAtPixel(row, column)
		if(column-row < 5 || 5 < column-row)
			return -0.05*(column-row)
		end
		return 0
	end
	def self.mapTo255(input, min, max)
		if(min==0 && max == 0)
			return 0;
		end
		val = ((((input.to_f)-min)/(max-min))*255)
		return val.to_i
	end

	def self.calcColorGradient(grey)
		arr = Array.new(3)
		if(grey<64)
			arr=[255-64,grey*3,64]
		elsif(grey<128)
			grey= grey-64
			arr=[255-grey*3,255-64,64]
		elsif(grey<192)
			grey= grey-128
			arr=[64,255-64,grey*3]
		else
			grey= grey-192
			arr=[64,255-grey*3,255-64]
		end
		return arr
	end

	def self.smootherCalcColorGradient(grey)
		arr = Array.new(3)
		if(grey<64)
			arr=[255-64,grey*2+64,64]
		elsif(grey<128)
			grey= grey-64
			arr=[255-grey*2-64,255-64,64]
		elsif(grey<192)
			grey= grey-128
			arr=[64,255-64,grey*2+64]
		else
			grey= grey-192
			arr=[64,255-grey*2-64,255-64]
		end
		return arr
	end
       def self.brighterSmootherCalcColorGradient(grey)
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
		return arr
	end
	def self.notsomuchBrighterSmootherCalcColorGradient(grey)
		arr = Array.new(3)
		if(grey<64)
			arr=[255-32,(grey*3).to_i+32,32]
		elsif(grey<128)
			grey= grey-64
			arr=[255-(grey*3).to_i-32,255-32,32]
		elsif(grey<192)
			grey= grey-128
			arr=[32,255-32,(grey*3).to_i+32]
		else
			grey= grey-192
			arr=[32,255-(grey*3).to_i-32,255-32]
		end
		return arr
	end
			
end
