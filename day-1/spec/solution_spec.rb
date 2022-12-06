require 'rspec'
require_relative 'spec_helper'
require_relative '../solution'

describe "#part one" do 
	it "Get the calories of the elf with the most calories" do 
		sample_numbers = [[1_000, 2_000, 3_000], [4_000], [5_000, 6_000], [7_000, 8_000, 9_000], [10_000]]
		expect(part_one(sample_numbers)).to eq 24_000
	end
end

describe "#part two" do 
	it "solves part two for sample data" do 
		sample_numbers = [607,618,618,617,647,716,769,792]
		expect(part_two(sample_numbers)).to eq 5
	end
end
