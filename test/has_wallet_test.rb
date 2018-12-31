require 'test_helper'
module HasWallet
  class Test < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, HasWallet
    end

    test 'class_instance_included' do
      user = User.new
      admin = Admin.new

      assert_raise(NoMethodError) { admin.wallet_amount }
      assert_equal user.wallet_amount, 1000
    end

    test 'class_methods_included' do
      assert_raise(NoMethodError) { Admin.my_name }
      assert_equal User.my_name, User.to_s
    end
  end
end
