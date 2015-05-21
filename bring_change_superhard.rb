require 'pry'
class Register
	attr_accessor :QUARTER_DENOM, :DIME_DENOM, :NICKEL_DENOM, :PENNY_DENOM, :coin_types
	@@QUARTER_DENOM = 25
	@@DIME_DENOM = 10
	@@NICKEL_DENOM = 5
	@@PENNY_DENOM = 1
	@@coin_types = [@@QUARTER_DENOM, @@DIME_DENOM, @@NICKEL_DENOM, @@PENNY_DENOM]
	def initialize starting_register
		@register = starting_register
		@coins_used = [0,0,0,0]
	end

	def change_coint_type(original_value, replacement_value)
		index = @@coin_types.index(original_value)
		puts "original value is #{original_value}"
		puts "Index is #{index} "
		@@coin_types[index] = replacement_value
		@@coin_types.sort.reverse!

	end
	def compare (coin_denomination, available_coins, total)
		if total < (available_coins * coin_denomination)
			return (total/coin_denomination)
		else
			return available_coins
		end
	end

	def change (goal)
		goal = (goal * 100).to_int
		quarters_used = compare(@@coin_types[0], @register[0], goal)
		@coins_used[0] = quarters_used
		goal -= (quarters_used * @@coin_types[0])

		dimes_used = compare(@@coin_types[1], @register[1], goal)
		@coins_used[1] = dimes_used
		goal -= dimes_used * @@coin_types[1]

		nickels_used = compare(@@coin_types[2], @register[2], goal)
		@coins_used[2] = nickels_used
		goal -= nickels_used * @@coin_types[2]

		pennies_used = compare(@@coin_types[3], @register[3], goal)
		@coins_used[3] = pennies_used
		goal -= pennies_used * @@coin_types[3]

		if goal > 0
			@coins_used = [-1,-1,-1,-1]
		else
		  return @coins_used
		end
	end

end

r = Register.new ([3,2,5,6])
puts r.change(0.37)
r.change_coint_type(1, 6)
puts r.change(0.57)
puts r.change(0.55)
puts r.change(0.57)
puts r.change(0.06)


