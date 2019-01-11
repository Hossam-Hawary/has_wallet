require 'test_helper'
module HasWallet
  class ChargingTest < ActiveSupport::TestCase
    def setup
      @user = User.new
    end

    test 'charging methods are present' do
      assert_nothing_raised do
        @user.available_amount
        @user.charge_me 1
        @user.can_afford? 1
      end
    end

    test 'cannot afford nil amount' do
      assert_equal false, @user.can_afford?(nil)
    end

    test 'cannot afford more than available_amount' do
      assert_equal false, @user.can_afford?(@user.available_amount + 0.1)
    end

    test 'can afford less than available_amount' do
      assert @user.can_afford?(@user.available_amount - 0.1)
    end

    test 'can afford up to available_amount' do
      assert @user.can_afford?(@user.available_amount)
    end

    test 'cannot afford negative amount' do
      assert_equal false, @user.can_afford?(-0.1)
    end
  end
end
