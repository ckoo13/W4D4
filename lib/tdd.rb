require "byebug"
# class Array

#     def my_uniq
#         fin_arr = []

#         self.each {|ele| fin_arr << ele if !fin_arr.include?(ele)}
        
#         fin_arr
#     end

#     def two_sum
#         pairs = []
    
#         self.each_index do |i|
#           ((i + 1)...self.length).to_a.each do |j|
#             pairs << [i, j] if self[i] + self[j] == 0
#           end
#         end
    
#         pairs
#     end

#     def my_transpose
#         arr = []

#         (0..2).each do |i|
#         inner_arr = []
#             self.each do |subarr|
#             inner_arr << subarr[i]
#             end
#         arr << inner_arr
#         end
#         arr 
#     end
# end

# #not in Array Class
# def stock_picker(array)
#     profit_counter = 0
#     fin_arr = []

#     array.each.with_index do |ele, i|
#         array.each.with_index do |ele2, j|
#             if j > i && (ele2 - ele) >= profit_counter
#                 fin_arr = [i,j]
#                 profit_counter = ele2 - ele
#             end
#         end
#     end
    
#     return 0 if fin_arr.empty?
    
#     fin_arr
# end

class Tower
    attr_accessor :board

    def initialize
        @board = Array.new(3) {Array.new}
        self.place_disks
    end

    # def [](pos)
    #     row, col = pos
    #     @board[row][value]
    # end

    # def []=(pos, value)
    #     row,col = pos
    #     @board[row][col] = value
    # end

    def move(start, end_pos)
       raise "You can't move there" if start < 0 || start > 2
       raise "You can't move there" if end_pos < 0 || end_pos > 2
        element = @board[start].pop

        if @board[end_pos].empty? || @board[end_pos].last > element
            @board[end_pos] << element
        end

        @board
    end
    
    def won?
        @board === [[],[],[4,3,2,1]]
    end

    def play
        # self.place_disks

        until won?
        puts "Please choose starting stack and ending stack with a comma in between"

        pos = gets.chomp.split(",").to_i
        move(pos[0],pos[1])
        end
    end

    def place_disks
        (1..4).each do |i|
            @board[0].unshift(i)
        end
    end
end

