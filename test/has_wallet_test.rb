require 'test_helper'
module HasWallet
  class Test < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, HasWallet
    end

    test 'instance methods included for models that has_wallet' do
      assert_raise(NoMethodError) { Admin.new.wallet_amount }
      assert_equal 1000, User.new.wallet_amount
    end

    test 'class methods included for models that has_wallet' do
      assert_raise(NoMethodError) { Admin.my_name }
      assert_equal User.to_s, User.my_name
    end
  end
end
