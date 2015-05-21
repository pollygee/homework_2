require 'pry'
require 'minitest/autorun'
class Register
	@@QUARTER_DENOM = 25
	@@DIME_DENOM = 10
	@@NICKEL_DENOM = 5
	@@PENNY_DENOM = 1

	def initialize starting_register
		@register = starting_register
		@coins_used = [0,0,0,0]
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
		quarters_used = compare(@@QUARTER_DENOM, @register[0], goal)
		@coins_used[0] = quarters_used
		goal -= (quarters_used * @@quarter_denom)

		dimes_used = compare(@@DIME_DENOM, @register[1], goal)
		@coins_used[1] = dimes_used
		goal -= dimes_used * @@dime_denom

		nickels_used = compare(@@NICKEL_DENOM, @register[2], goal)
		@coins_used[2] = nickels_used
		goal -= nickels_used * @@nickel_denom

		pennies_used = compare(@@PENNY_DENOM, @register[3], goal)
		@coins_used[3] = pennies_used
		goal -= pennies_used * @@penny_denom

		if goal > 0
			@coins_used = [-1,-1,-1,-1]
		else
		  return @coins_used
		end
	end

end



class TestforChange < MiniTest::Test
	def test_1
		r = Register.new([1,4,2,9])
		assert_equal [1,3,1,1], r.change(0.61)
	end

	def test_3
		r = Register.new([1,0,3,2])
		assert_equal [1,0,3,2], r.change(0.42)
	end

	def test_not_enough_coins
		r = Register.new([0,1,2, 4])
		assert_equal [-1,-1,-1,-1], r.change(0.41)
	end
end

