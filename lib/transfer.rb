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
        sender.balance - amount > 0
    end


    def valid?
        @sender.valid? && @receiver.valid?
    end

    def execute_transaction
        if validTransfer? &&  self.valid?
            sender.balance -= amount
            receiver.deposit(amount)
            @status = "complete"
        else
            @status = "rejected"
            "Transaction rejected. Please check your account balance"
        end
    end

end
