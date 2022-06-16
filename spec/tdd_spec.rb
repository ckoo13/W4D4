require 'tdd'

# describe Array do
    
#     describe "Array#my_uniq" do
#         let(:array) { [1,2,1,3,3] }
    
#         context 'when an array has duplicates' do
#             it 'should return a new array containing unique elements from the original array' do
#                 expect(array.my_uniq).to eq([1,2,3])
#             end
#         end 
#     end

#     describe "Array#two_sum" do
#         let(:array) { [-1, 0, 2, -2, 1] }

#         it 'finds all pairs of positions where the elements at those positions sum to zero' do
#             expect(array.two_sum).to eq ([[0,4], [2,3]])
#         end
        
#         it 'should sort the pairs with smaller index before bigger index' do 
#             expect(array.two_sum).not_to eq([[4,0], [3,2]])
#         end

#         it 'should sort the pairs dictionary-wise' do
#             expect(array.two_sum).not_to eq([[2,3], [0,4]])
#         end
#     end

#     describe "Array#my_transpose" do
#         let(:rows) { [ 
#             [0,1,2],
#             [3,4,5],
#             [6,7,8]
#         ] }
#         let(:columns) { [ 
#             [0,3,6],
#             [1,4,7],
#             [2,5,8]
#         ] }
#         context 'we can have a 2D array with the contained arrays representing rows and columns' do
#             it 'should return a new 2D array which converts between the row-oriented and column-oriented 2D array' do
#                 expect(rows.my_transpose).to eq(columns)
#             end
#         end
#     end
# end

# describe "#stock_picker" do
    
#     context 'given an array of stock prices (prices on days(index) 0,1..)' do
#         it "should take an one array as an argument" do
#             expect {stock_picker()}.to raise_error(ArgumentError)
#         end

#         it 'returns an array with of the most profitable pair of days on which to first buy the stock and sell the stock' do
#             expect(stock_picker([2, 3, 4, 5, 1, 4])). to eq([4,5])
#         end

#         it 'should return 0 if there are no profitable days' do 
#             expect(stock_picker([7,6,5,4,3,2])).to eq(0)
#         end

#         it 'the purchase date must be before the sell date' do 
#             expect(stock_picker([2,3,4,5,1,4])).to_not eq([3,4])
#         end
#     end
# end

describe Tower do
    let(:tower) { Tower.new }
    
    describe "#initialize" do
        it "@board should be a 2D array of length 3" do
            expect(tower.board.length).to eq(3)
        end
    end

    describe "#move" do
        
        after = [[4,3,2],
                 [1],            
                 [ ],
                ]
        it "should return the new state of the board" do
            expect(tower.move(0,1)).to eq(after)
        end

        it "should raise an error if the move is invalid" do
            expect {tower.move(0,4)}.to raise_error("You can't move there")
        end
    end

    describe '#won?' do
        tower_win = Tower.new
        tower_win.board = [[],[],[4,3,2,1]]
        tower_lose = Tower.new
        tower_lose.board = [[4,3,2,],[1],[]]

        it "should return false when the game has not ended" do
            expect(tower_lose.won?).to be false
        end

        it "should return true when the game has ended" do
            expect(tower_win.won?).to be true
        end
    end
    
    describe '#place_disks' do
        before(:each) do
            tower = Tower.new
        end

        it 'should place the disks onto the first array inside the board' do
            expect(tower.board).to eq([[4,3,2,1], [], []])
        end
    end
end

