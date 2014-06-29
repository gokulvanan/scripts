# THREE GOLD STARS

# Sudoku [http://en.wikipedia.org/wiki/Sudoku]
# is a logic puzzle where a game
# is defined by a partially filled
# 9 x 9 square of digits where each square
# contains one of the digits 1,2,3,4,5,6,7,8,9.
# For this question we will generalize
# and simplify the game.

# Define a procedure, check_sudoku,
# that takes as input a square list
# of lists representing an n x n
# sudoku puzzle solution and returns the boolean
# True if the input is a valid
# sudoku square and returns the boolean False
# otherwise.

# A valid sudoku square satisfies these
# two properties:

#   1. Each column of the square contains
#       each of the whole numbers from 1 to n exactly once.

#   2. Each row of the square contains each
#       of the whole numbers from 1 to n exactly once.

# You may assume the the input is square and contains at
# least one row and column.

correct = [[1,2,3],
           [2,3,1],
           [3,1,2]]

incorrect = [[1,2,3,4],
             [2,3,1,3],
             [3,1,2,3],
             [4,4,4,4]]

incorrect2 = [[1,2,3,4],
             [2,3,1,4],
             [4,1,2,3],
             [3,4,1,2]]

incorrect3 = [[1,2,3,4,5],
              [2,3,1,5,6],
              [4,5,2,1,3],
              [3,4,5,2,1],
              [5,6,4,3,2]]

incorrect4 = [['a','b','c'],
              ['b','c','a'],
              ['c','a','b']]

incorrect5 = [ [1, 1.5],
               [1.5, 1]]
               
def check_sudoku_2(data):
  N = len(data)
  i = 0
  item = 1
  while i < N:
    j = 0
    rowcount=0
    colcount=0
    while j < N:
      if item == data[i][j]: rowcount += 1
      if item == data[j][i]: colcount += 1
      j = j + 1
    if rolwcount > 1 or colcount > 1: return False
    item += 1
    i += 1



def check_sudoku(data):
    N = len(data)
    colbuff=[]
    i = 0
    while i < N:
        colbuff.append([])
        i = i + 1
    r = 0
    for row in data:
        rowbuff = []
        c = 0
        for val in row:
            if type(val) is not int:
                return False
            elif val > N or val < 1:
                return False
            elif val in rowbuff:
                return False
            elif val in colbuff[c]:
                return False
            else:
                rowbuff.append(val)
                colbuff[c].append(val)
            c = c + 1
        r = r + 1        
    return True        
                
    




    
    
print check_sudoku(incorrect)
#>>> False

print check_sudoku(correct)
#>>> True

#print check_sudoku(incorrect2)
#>>> False

#print check_sudoku(incorrect3)
#>>> False

#print check_sudoku(incorrect4)
#>>> False

#print check_sudoku(incorrect5)
#>>> False



