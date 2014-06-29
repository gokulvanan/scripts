
# By Websten from forums
#
# Given your birthday and the current date, calculate your age in days. 
# Account for leap days. 
#
# Assume that the birthday and current date are correct dates (and no 
# time travel). 
#

month = [0,31,28,31,30,31,30,31,31,30,31,30,31]

def leap_year(year):
  if(year % 4 == 0):
    if year % 100 == 0:
      return year % 400 == 0
    else:
      return True
  else:
    return False

def daysBetweenDates(year1, month1, day1, year2, month2, day2):
    age= 0
    while year1 < year2:
        age +=  366 if leap_year(year1) else 365
        year1 += 1
    if month1 > 2 and leap_year(year2):
        age +=1
    while month1 < month2:
        age += month[month1]
        if leap_year(year2) and month1 == 2:
            age += 1
        month1 += 1
    age += day2 - day1
    return age


# Test routine

def test():
    test_cases = [
                  #((2012,1,1,2012,2,28), 58), 
                  #((2012,1,1,2012,3,1), 60),
                  #((2011,6,30,2012,6,30), 366),
                  #((2011,1,1,2012,8,8), 585 ),
                  ((1900,1,1,1999,12,31), 36523)
                 ]
    for (args, answer) in test_cases:
        result = daysBetweenDates(*args)
        if result != answer:
            print "Test with data:", args, "failed"
        else:
            print "Test case passed!"

test()

