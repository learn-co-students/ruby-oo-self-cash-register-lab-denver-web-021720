
class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=0)
        @total = 0 
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        
        quantity.times do 
            @items.push(title)
        end

        @last_item = price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end

        @total -= (@total * (@discount.to_f / 100.0)).to_i

        return "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        @total -= @last_item
    end
end