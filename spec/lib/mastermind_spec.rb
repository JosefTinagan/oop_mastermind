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
end