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
        @amount < @sender.balance
    end

    def valid?
        @sender.valid? && @receiver.valid?
    end

    def execute_transaction
        if self.valid?
                @sender.transfer(amount)
                @receiver.deposit(amount)
                @status = "complete"
                @sender.close_account
        else
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
        end
    end

    def reverse_transfer
        if status == "complete"
            sender.deposit(amount)
            receiver.transfer(amount)
            status = "reversed"
    end
    end

end
