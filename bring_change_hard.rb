#require 'pry'
require 'minitest/autorun'
class Register
	def initialize starting_register
		@register = starting_register
		@quarter = 0
		@dime = 0
		@nickel = 0
		@penny = 0
	end

	def change amt_of_money
		amt_of_money = (amt_of_money * 100).to_int
		if (amt_of_money > 25)  && (@register[0] > 0)
			need_quarters = amt_of_money / 25 
			#if i have what i need, take what I need to quarters, subtract that amt from total
			if @register[0] > need_quarters
				@quarter += need_quarters.to_int
				amt_of_money -= (25 * @quarter)
			#if I don't have what I need, take the ones I do have, add to quarters
			else 
				@quarter += @register[0]
				
			end
		end

		if amt_of_money > 10
			need_dimes = amt_of_money / 10
			if need_dimes <= @register[1]	
				@dime += need_dimes.to_int
				amt_of_money -= (10 * @dime)
			else
				puts 'not enough dimes'
			end
		end	

		if amt_of_money > 05
			need_nickels = amt_of_money / 05
			if need_nickels <= @register[2]
				@nickel += need_nickels.to_int
				amt_of_money -= (05 * @nickel)
			else
				puts 'not enough nickels'
			end
		end

		if amt_of_money > 0
			need_pennies = amt_of_money / 1
			if need_pennies <= @register[3]
				@penny += need_pennies.to_int
				amt_of_money -= @penny
			else
				raise 'Register does not contain enough change'
			end
		end

		return [@quarter, @dime, @nickel, @penny]
	end
end



class TestforChange < MiniTest::Test
	def test_1
		r = Register.new
		assert_equal [3,2,0,4], r.change(0.99)
	end

	def test_2
		r = Register.new
		assert_equal [5,0,0,0], r.change(1.25)
	end

	def test_3
		r = Register.new
		assert_equal [0,0,1,1], r.change(0.06)
	end

	def test_4
		r = Register.new
		assert_equal [1,1,1,1], r.change(0.41)
	end

	def test_5
		r = Register.new
		assert_equal [0,0,0,0], r.change(0.00)
	end
end

