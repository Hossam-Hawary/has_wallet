module HasWallet
  module ActiveWallet
    def has_wallet(_options = {})
      # Include instance methods
      include InstanceMethods

      # Include dynamic class methods
      extend ClassMethods
    end
  end
end

# this will make has_wallet class method available in any model
ActiveSupport.on_load :active_record do
  send :extend, HasWallet::ActiveWallet
end
