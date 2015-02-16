#In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques.
#It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet.
#For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.
#-Wikipedia

=begin 
	From theodinproject:

	Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
	
	 > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"
	
=end


##Right now it only works for positive letter-shifting, i.e. second parameter must be positive.
##Could implement wrapping from a to z, but that'd bloat the code and it's not really an important feature.
#If one wishes to move a's to z's, they can just use 25 to do so. (English alphabet has 26letters)


def caesar_cipher text, shift = 5 			#shifts letters by 5 on default
	letters = text.split(//)
	ncrypted_string = ""

	letters.each do |x|
		if (x =~ /\w/) && (x =~ /\D/) && (x != "_") 					##Checks with RegEx's whether the current array index' value is a word character + a non-digit character + not an underscore '_', so only a-z & A-Z letters pass the test and are affected by the following code.
			if x == x.upcase											##<-I do this so I can wrap back to A when Z's #ord index is exceeded. "A".ord == 65, "Z".ord == 90
				x = x.ord + shift
				if x > 90
					x -= 90
					x += 64
				end
			elsif x == x.downcase										##Same is done here for downcases as is done above for upcases. "a".ord == 97, "z".ord == 122
				x = x.ord + shift
				if x > 122
					x -= 122
					x += 96
				end
			end
			x.chr 				#convert new index number back to a character
		end
		ncrypted_string << x 	##push current letter into a new string.
	end
	puts ncrypted_string
end

caesar_cipher("What a string!", 5)					##should modify everything except the ending '!' and the whitespaces

caesar_cipher("abCDEfg!! __ -- ^^ 77 // ¨¨ ~~", 1)	#Should only modify the leading "abCDEfg"

caesar_cipher("First task complete, 2 to go!")