require "rspec"
require_relative "../Roman.rb"

describe "Step one: Convert differences to additions" do
  before :each do
		@conversion = Conversion.new
	end

	it "Converts IV to IIII" do
		expect(@conversion.diff_to_add("IV")).to eq("IIII")
	end
	it "Converts XIX to XVIIII" do
		expect(@conversion.diff_to_add("XIX")).to eq("XVIIII")
	end
end

describe "Step two: Merge and sort two roman numbers" do
  before :each do
		@conversion = Conversion.new
	end

	it "Merge and sort IV and IX into XVII" do
		expect(@conversion.merge_and_sort("IV","IX")).to eq("XVII")
	end
end

describe "Step three: Replace the equivalences for the repetitive numbers" do
	before :each do
		@conversion = Conversion.new
	end
	it "Replace LLXXXXXVV to CLX" do
		expect(@conversion.equivalences("LLXXXXXVV")).to eq("CLX")
	end
end

describe "Step four: Now invert step 1, replace additions with differences" do
	before :each do
		@conversion = Conversion.new
	end
	it "Replace XVIIII to XIX" do
		expect(@conversion.add_to_diff("XVIIII")).to eq("XIX")
	end
end

describe "Final Step! : Add to roman numbers :)" do
	before :each do
		@conversion = Conversion.new
	end
	it "Add " do
		expect(@conversion.addition("CXLV","LXXIX")).to eq("CCXXIV")
	end
end