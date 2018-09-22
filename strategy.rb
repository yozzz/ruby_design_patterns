# Pull the algorithm out into a separate object
# created objects(strategies) will become a family of algorithms
# code will receive run-time instructions on which algorithm to use

class Package

	def initialize(packaging)
		@packaging = packaging
	end

	def pack
		@packaging.pack
	end
end


class GlassWaterPackaging
	
	def pack
		puts "Wrapping the bottle in bubble wrap..."
		puts "Sealing bottle in the in a plastic bag..."
		puts "Stuffing empty spaces in the box with packing material..."
		puts "Placing inside the box..."
		puts "Done."
	end

end

class DryIcePackaging

	def pack
		puts "Putting dry ice into plastic bag..."
		puts "Putting bag with dry ice into styrofoam box..."
		puts "Put styrofoam box into fiberboard..."
		puts "Done."
	end

end

glass_package = Package.new(GlassWaterPackaging.new)
glass_package.pack

Package.new(DryIcePackaging.new).pack
