# GoF
# Define the skeleton of an algorithm in an operation, deferring some steps to subclasses.
# Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm’s structure.
#-----------------------------------------------------
# Use the Strategy pattern when you want to vary an entire algorithm.
# Use the Template Method when you want to vary steps of an algorithm.

class PorkBarbecue

	def prepare
		slice_meet
		slice_onion
		marinade
		mix_it
	end

	def cook
		# cook it
	end

	def slice_meet
		# just do it
	end

	def slice_onion
		# just do it
	end

	def marinade 
		raise 'Please made some cool specific marinade'
	end

	def mix_it
		# mix all this things
	end

end	

class PomegranatePorkBarbecue < PorkBarbecue
	def marinade 
		@marinade = PomegranateMarinade.new
	end
end

class ClassicPorkBarbecue	< PorkBarbecue
	def marinade
		@marinadte = ClassicMarinade.new
	end
end
