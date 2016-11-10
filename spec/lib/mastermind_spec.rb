require 'spec_helper'
require 'mastermind'

describe Mastermind do
	mm = Mastermind.new
	mm2 = Mastermind.new("Jake")

	it "initializes with a default name" do
		param = mm.name
		expect(param).to eq("You")
	end

	it "initializes with an optional name" do
		param = mm2.name
		expect(param).to eq("Jake")
	end

	it "can show a list of available colors" do
		param = mm.available_colors
		expect(param).to eq(["red","orange","yellow","green","blue","white","black"])
	end 

	it "can choose game mode breaker" do
		mm.send(:mode_chose,1)
		param = mm.mode
		expect(param).to eq("BREAKER")
	end

	it "can choose game mode master" do
		mm2.send(:mode_chose,2)
		param = mm2.mode
		expect(param).to eq("MASTER")
	end

	it "can choose game mode by user input" do
		mm.send(:choosing_mode)
		param = mm.mode
		expect(param).to eq("BREAKER")
	end

	it "prompt when 12 turns are up" do
		param = mm.send(:game_over)
		expect(param).to eq("Game Over")
	end

	it "computer makes a secret code" do
		param = mm.send(:code_maker)
	end

	xit "returns error if code length is not 4" do

	end

	it "guess a code" do 
		param = mm.send(:ask_code)
		expect(param).to eq(["red","orange","yellow","green"])
	end

	it "check color if valid" do 
		param = mm.send(:check_if_valid_color?,"blu")
		expect(param).to eq(false)
	end

	it "check code if correct or not" do
		param = mm.send(:check_secret_code,["red","orange","yellow","green"],["blue","blue","green","green"])
		expect(param).to eq(true)
	end

	it "start game" do
		mm.start_guessing
	end
end