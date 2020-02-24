class yster_card

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 0

    attr_reader :balance

    def initialize
       @balance = 0
    end

    def top_up(amount)
      maximum_balance = MAXIMUM_BALANCE
      fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def deduct(amount)
      minimum_balance = MINIMUM_BALANCE
      fail "Minimum balance of #{minimum_balance} reached" if balance - amount < MINIMUM_BALANCE
      @balance -= amount
    end

end
