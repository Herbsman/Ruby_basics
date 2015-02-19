=begin 
	Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary),
	as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string
	and how many times it was found.

	
    > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

    > substrings("below", dictionary)
    => {"below"=>1, "low"=>1}

=end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "ho", "yo", "slip", "slop", "duck"]

def substrings string, dictionary
	string_split = string.downcase.split(" ")
	hash = {}

	dictionary.each do |index|
		string_split.each do |word|
			if word.include?(index)
				if hash[index] == nil
					hash[index] = 1
				else
					hash[index] += 1
				end
			end
		end
	end

	p hash

end


substrings("Howdy partner, sit down! How's it going?", dictionary)
substrings("A mighty brave duckling slid down the slippery slope! 'Howdy!', he said.", dictionary)
substrings("yo ho yo yo yo ho ho", dictionary)