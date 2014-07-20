class Conversion
	def initialize
		@values = "IVXLCDM"

		@equivalences = {
			"M" => " DD",
			"D" => "CCCCC",
			"C" => "LL",
			"L" => "XXXXX",
			"X" => "VV",
			"V" => "IIIII",
			"I" => "I"
		}

		@diff_add = {
			"DCCCC" => "CM",
			"CCCC" => "CD",
			"LXXXX" => "XC",
			"XXXX" => "XL",
			"VIIII" => "IX",
			"IIII" => "IV"
		}
	end

	#step1
	def diff_to_add(roman)
		@diff_add.each do |add, diff|
			roman.gsub!(diff,add)
		end
		roman
	end

	#step2
	def merge_and_sort(roman1, roman2)
		roman1.chars.concat(roman2.chars).sort_by{|n| [@values.index(n)]}.join.reverse
	end

	#step3
	def equivalences(roman)
		while roman.match(/DD|CCCC|LL|XXXXX|VV|IIIII/) do
			@equivalences.each do |number,equivalence|
				roman.gsub!(equivalence,number)
			end
		end
		roman
	end

	#step4
	def add_to_diff(roman)
		@diff_add.each do |add, diff|
			roman.gsub!(add,diff)
		end
		roman
	end

	#adition
	def addition(roman1,roman2)
		merged = merge_and_sort(diff_to_add(roman1),diff_to_add(roman2))
		puts merged
		add_to_diff(equivalences(merge_and_sort(diff_to_add(roman1),diff_to_add(roman2))))
	end
end