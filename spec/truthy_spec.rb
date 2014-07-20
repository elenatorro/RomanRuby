require "rspec"
require_relative "../Roman.rb"

describe "Step one: Convert to I" do
  before :each do
		@conversion = Conversion.new
	end

	it "Convert V to 5I" do
		expect(@conversion.parse("V")).to eql("I"*5)
	end

	it "Convert IV to 4I" do
		expect(@conversion.parse("IV")).to eql("I"*4)
	end

	it "Convert IX to 9I" do
		expect(@conversion.parse("IX")).to eql("I"*9)
	end

	it "Convert XIX to 19I" do
		expect(@conversion.parse("XIX")).to eql("I"*19)
	end

	it "Convert LX to 60I" do
		expect(@conversion.parse("LX")).to eql("I"*60)
	end

	it "Convert XX to 20I" do
		expect(@conversion.parse("XX")).to eql("I"*20)
	end
	it "Convert XL to 40I" do
		expect(@conversion.parse("XL")).to eql("I"*40)
	end
	
	it "Convert XXIV to 24I" do
		expect(@conversion.parse("XXIV")).to eql("I"*24)
	end
end

describe "Step 2: Add two romans" do
	before :each do
		@conversion = Conversion.new
	end
	
	it "V add II" do
		expect(@conversion.add_romans("V","II")).to eq("I"*7)
	end

	it "CLVI add DCCCLIV" do
		expect(@conversion.add_romans("CLVI","DCCCLIV")).to eq("I"*1010)
	end
end

describe "Step 3: Convert from I to roman" do
  before :each do
		@conversion = Conversion.new
	end
	
	it "IIIII to V" do
		expect(@conversion.parse_addition("IIIII")).to eq("V")
	end
	it "IIIIII to VI" do
		expect(@conversion.parse_addition("IIIIII")).to eq("VI")
	end
	it "15I to XV" do
		expect(@conversion.parse_addition("I"*15)).to eq("XV")
	end
	it "26 to XXVI" do
		expect(@conversion.parse_addition("I"*26)).to eq("XXVI")
	end
	it "19I to XIX" do
		expect(@conversion.parse_addition("I"*19)).to eq("XIX")
	end
end