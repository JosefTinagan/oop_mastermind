class Mastermind
	attr_accessor :name, :mode
	@@array_of_colors = ["red","orange","yellow","green","blue","white","black"]

	def initialize(name="You")
		@name = name
		#@mode = choosing_mode
	end

	def start_guessing
		code_to_break = code_maker
		puts "Computer is generating a code..."
		puts code_to_break
		
	end

	def available_colors
		@@array_of_colors
	end

	private
	
	def check_secret_code

	end

	def ask_code 
		color_guess = []
		array_of_question_order = ["first", "second", "third", "fourth"]
	
		array_of_question_order.each do |nth|
			puts "Enter #{nth} color: "
			x = gets.chomp
				if check_if_valid_color?(x)
					color_guess.push(x)
				else
					puts "That color does not exist try again..."
					redo
				end
		end
		color_guess
	end

	def check_if_valid_color?(color)
		valid = false
		@@array_of_colors.each do |x|
			if color.downcase == x
				valid = true
			end
		end
		return valid
	end

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
		computer_color_code = []
		4.times do 
			computer_color_code.push(@@array_of_colors.sample)
		end
		computer_color_code
	end

	def game_over
		return "Game Over"
	end

end
