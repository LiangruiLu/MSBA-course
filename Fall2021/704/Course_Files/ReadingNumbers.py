"""
File: ReadingNumbers.py
Inputs lines of integers from a text file and outputs the sum
"""
f = open("integers.txt", 'r')
theSum = 0
for line in f:
	line = line.strip() # removes leading/trailing spaces
	number = int(line)
	theSum += number
print("The sum is", theSum)
