require "rspec"
require_relative "../Roman.rb"

describe "Parse roman" do
  before :each do
		@conversion = Conversion.new
	end

	it "Convert V to IIIII" do
		expect(@conversion.parse("V")).to eql("IIIII")
	end

	it "Convert IV to IIII" do
		expect(@conversion.parse("IV")).to eql("IIII")
	end

	it "Convert IX to IIIIIIIII" do
		expect(@conversion.parse("IX")).to eql("IIIIIIIII")
	end

	it "Convert XIX to IIIIIIIII" do
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

describe "Add two romans" do
	before :each do
		@conversion = Conversion.new
	end
	
	it "V add II" do
		expect(@conversion.add_romans("V","II")).to eq("I"*7)
	end
  
end