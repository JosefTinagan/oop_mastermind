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
		code_guessed = ask_code

		check_secret_code(code_to_break,code_guessed)
	end

	def available_colors
		@@array_of_colors
	end

	private
	
	def check_secret_code(secret_code,guessed_code)
		puts secret_code.inspect
		puts guessed_code.inspect
		
		color_right_spot = 0
		color_wrong_spot = 0
		arrays_of_stored_number = []
		arrays_of_stored_colors = []
		arrays_of_wrong_spot_colors = []
		#checking for right color and spot
		i = secret_code.length - 1
		while i != 0
			#puts "#{secret_code[i]} : #{guessed_code[i]}"
			if secret_code[i] == guessed_code[i]
				puts "Color in the right spot!"
				arrays_of_stored_number.push(i)
				arrays_of_stored_colors.push(guessed_code[i])
				secret_code.delete_at(i)
				guessed_code.delete_at(i)
				color_right_spot += 1
			end
			i -= 1
		end
		puts "#{color_right_spot} color(s) in the right spot!"


		#puts secret_code.inspect
		#puts guessed_code.inspect
		#puts arrays_of_stored_number.inspect
		#checking for color in wrong spot
		for i in 0..secret_code.length - 1
			if secret_code.include?(guessed_code[i])
				color_wrong_spot += 1
				arrays_of_wrong_spot_colors.push(guessed_code[i])
			end
		end

		puts "#{color_wrong_spot} color)s in the wrong spot!"

		#computer generates new code
		if @mode == "MASTER"
			puts "Stored numbers: #{arrays_of_stored_number}"
			puts "Stored colors: #{arrays_of_stored_colors}"

			times_to_loop = 4 - (color_wrong_spot + color_right_spot)

			new_code = code_maker(times_to_loop)

			for i in 0..arrays_of_wrong_spot_colors.length - 1
				new_code.push(arrays_of_wrong_spot_colors[i])
			end
			puts new_code.inspect
			new_code.shuffle!
			for i in 0..arrays_of_stored_number.length - 1
				new_code.insert(arrays_of_stored_number[i],arrays_of_stored_colors[i])

			end
			new_code.compact!
			puts new_code.inspect
			new_code
		end

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

	def code_maker(number_of_times=4)
		computer_color_code = []
		number_of_times.times do 
			computer_color_code.push(@@array_of_colors.sample)
		end
		computer_color_code
	end

	def game_over
		return "Game Over"
	end

end
