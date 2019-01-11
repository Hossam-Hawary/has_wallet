module HasWallet
  module InstanceMethods
    def wallet_amount
      1000
    end

    def available_amount
      wallet_amount
    end

    def charge_me(
      amount,
      options = {
        occurred_at: Time.zone.now, notes: ''
      }
    )
      return false unless can_afford?(amount)

      deduct_amount amount, options
    end

    def can_afford?(amount)
      return false if amount.blank?
      return false if amount < 0

      amount <= available_amount
    end

    #####################

    private

    #####################

    def deduct_amount(amount, options)
      amount
    end
  end
end
