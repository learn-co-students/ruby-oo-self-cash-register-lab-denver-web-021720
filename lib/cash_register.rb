require 'pry'

class CashRegister 

    attr_accessor :discount, :total, :quantity, :last_item

    def initialize discount=0
        @total = 0
        @discount = discount
        @items = []
    end 

    def add_item title, price, quantity=1
        @title = title 
        @price = price
        @quantity = quantity
        @total += (@price * @quantity)
        # puts the title of each item into the @items array, "quantity" amounts of times, 
        # starting at the last index.
        @items.fill(title, @items.size, quantity)
        @last_item = price * quantity 
    end 

    def apply_discount
        self.total = self.total * (1 - (self.discount / 100.00))
        if self.discount == 0 
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{self.total.to_i}."
        end 
    end 

    def items 
        @items
    end 

    def void_last_transaction
        @total = @total - @last_item
    end 
end 

