class Transfer
    # attr_reader :
    attr_accessor :sender, :status, :receiver, :amount

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = 50
        @status = "pending"
    end

    def validTransfer?
        @sender.status = "rejected" if @amount > @sender.balance
    end

    def transfer
        @sender.balance -= @amount
        @receiver.deposit(amount)
    end

    def valid?
        @sender.valid? && @receiver.valid?
    end

    def execute_transaction
        if validTransfer? && self.valid?
                self.transfer
                @status = "complete"
                sender.close_account
        else
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
        end
    end

end
