class Mastermind
	attr_accessor :name, :mode

	def initialize(name="You")
		@name = name
		#@mode = choosing_mode
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
end