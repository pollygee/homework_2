#require 'pry'
require 'minitest/autorun'
class Register
	def initialize 
		@quarter = 0
		@dime = 0
		@nickel = 0
		@penny = 0
	end

	def change amt_of_money
		amt_of_money = (amt_of_money * 100).to_int
		if amt_of_money > 25
			add_quarters = amt_of_money / 25 
			@quarter += add_quarters.to_int
			amt_of_money -= (25 * @quarter)
		end

		if amt_of_money > 10
			add_dimes = amt_of_money / 10
			@dime += add_dimes.to_int
			amt_of_money -= (10 * @dime)
		end	

		if amt_of_money > 05
			add_nickels = amt_of_money / 05
			@nickel += add_nickels.to_int
			amt_of_money -= (05 * @nickel)
		end

		if amt_of_money > 0
			add_pennies = amt_of_money / 1
			@penny += add_pennies.to_int
			amt_of_money -= @penny
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
