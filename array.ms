--an empty array
arr=#()
--an array with things in it (note that the things do not have to be same type)
arr2=#("abc",[1,2,3],5,6)


--array indexing starts at 1 not 0
for i = 1 to 4 do(
 print arr2[i]
)

arr[1]=1
arr[2]=2

for i= 1 to 2 do(
	print arr[i]
)

--for loop and collect can be used to put values into an array

arr = for i = 5 to 10 collect i

--notice old array is gone
for i= 1 to 5 do(
	print arr[i]
)

"for in"
-- can go through each element using a for in statement
for i in arr do(
	print i    --prints the values in the array, not i
)