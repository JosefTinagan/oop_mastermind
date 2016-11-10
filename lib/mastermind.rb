class Mastermind
	attr_accessor :name, :mode
	attr_reader :color_guess
	@@array_of_colors = ["red","orange","yellow","green","blue","white","black"]

	def initialize(name="You")
		@name = name
		#@mode = choosing_mode
	end

	def guess
		print "Enter four colors (seperated by space): "
		@color_guess.join = gets.chomp

	end

	def available_colors
		@@array_of_colors
	end

	private
	
	def choosing_mode
		puts "Would you like to play as a code breaker or as a code master?"
		puts "[1] to play as a code breaker"
		puts "[2] to play as a code master"
		choice = gets.chomp
		mode_chose(choice.to_i)
	end

	def mode_chose(choice)
		if choice == 1
			@mode = "BREAKER"
		elsif choice == 2
			@mode = "MASTER"
		else
			puts "Invalid choice, try again..."
			choosing_mode
		end
	end

	def code_maker
		@computer_color_code = []
		4.times do 
			@computer_color_code.push(@@array_of_colors.sample)
		end
	end

	def game_over
		return "Game Over"
	end

end
