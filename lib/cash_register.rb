
class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=0)
        @total = 0 
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        
        quantity.times do 
            self.items.push(title)
        end

        self.last_item = price * quantity
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end

        self.total -= (self.total * (self.discount.to_f / 100.0)).to_i

        return "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        @total -= @last_item
    end
end