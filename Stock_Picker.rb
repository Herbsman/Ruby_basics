=begin 

Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

    > stock_picker([17,3,6,9,15,8,6,1,10])
    => [1,4]  # for a profit of $15 - $3 == $12

=end

def stock_picker array
	i, o, e = 0, 0, 0
	profit = 0
	days = []

	while o < array.length
		buy_day = array[o]
		i = e
		while i < array.length - 1
			i += 1
			sell_day = array[i]
			
			if sell_day - buy_day >= profit
				profit = sell_day - buy_day
				days.clear
				days.push(o, i)
			end	

		end
		e += 1
		o += 1
	end
	puts "Buy on on day #{days[0] + 1}, sell on day #{days[1] + 1}, for a profit of: #{profit}!"
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([2, 14, 3, 44, 9, 3, 1, 44])