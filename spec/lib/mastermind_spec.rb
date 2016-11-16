require 'spec_helper'
require 'mastermind'

describe Mastermind do
	#mm = Mastermind.new
	#mm2 = Mastermind.new("Jake")

	xit "initializes with a default name" do
		param = mm.name
		expect(param).to eq("You")
	end

	xit "initializes with an optional name" do
		param = mm2.name
		expect(param).to eq("Jake")
	end

	xit "can show a list of available colors" do
		param = mm.available_colors
		expect(param).to eq(["red","orange","yellow","green","blue","white","black"])
	end 

	xit "can choose game mode breaker" do
		mm.send(:mode_chose,1)
		param = mm.mode
		expect(param).to eq("BREAKER")
	end

	xit "can choose game mode master" do
		mm2.send(:mode_chose,2)
		param = mm2.mode
		expect(param).to eq("MASTER")
	end

	xit "can choose game mode by user input" do
		mm.send(:choosing_mode)
		param = mm.mode
		expect(param).to eq("BREAKER")
	end

	xit "prompt when 12 turns are up" do
		param = mm.send(:game_over)
		expect(param).to eq("Game Over")
	end

	xit "computer makes a secret code" do
		param = mm.send(:code_maker)
	end

	xit "returns error if code length is not 4" do

	end

	xit "guess a code" do 
		param = mm.send(:ask_code)
		expect(param).to eq(["red","orange","yellow","green"])
	end

	xit "check color if valid" do 
		param = mm.send(:check_if_valid_color?,"blu")
		expect(param).to eq(false)
	end

	xit "check code if correct or not" do
		param = mm.send(:check_secret_code,["red","orange","yellow","green"],["blue","blue","green","green"])
		expect(param).to eq(true)
	end

	xit "generate new guessed code automatically" do
		mm.send(:mode_chose,2)
		param = mm.send(:check_secret_code,["blue","red","red","yellow"],["green","red","blue","yellow"])
		expect(param).to eq(true)
	end

	xit "start game" do
		mm.send(:mode_chose,1)
		mm.start_guessing
	end

	it "computer guessing" do 
		mmcomputer = Mastermind.new("Jakey")
		#mm.send(:mode_chose,2)
	end
end