class Conversion
	def initialize
		@values = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"C" => 100,
			"D" => 500,
			"M" => 1000
		}

		@equivalences = {
			"IIIII" => "V",
			"VV"    => "X",
			"XXXXX"	=> "L",
			"LL"    => "C",
			"CCCCC" => "D",
			"DD"    => "M",
			"VIIII" => "IX"
		}
	end

	def parse(roman)
		i = 0
		result = ""
		while i < roman.length do
			if not roman[i+1].nil?
				if @values[roman[i]].to_i < @values[roman[i+1]].to_i
					result += "I"*(@values[roman[i+1]].to_i-(1*@values[roman[i]].to_i))
					i+=1
				else 
					result += "I"*(@values[roman[i]].to_i)
				end
			else 
			result += "I"*(@values[roman[i]].to_i)
			end
			i+=1
		end
		result
	end

	def add_romans(roman1,roman2)
		addition = parse(roman1)+parse(roman2)
	end

	def parse_addition(addition)
		i = 0
		result = ""
		ones = ""
		prev = ""
		while i < addition.length do
			ones += addition[i]
			if @equivalences.has_key?(ones)
				prev += @equivalences[ones]
				ones = ""
				if @equivalences.has_key?(prev)
					result+=@equivalences[prev]
					prev = ""
				end
			end
			i+=1
		end
		result+=prev+=ones
	end
end