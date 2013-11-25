struct Stuff(
	str,
	vector
)

--can create object by putting in values in order they are defined
--in the struct definition
s = Stuff "abc" [1,2,3]
--can also define it with property names
s2 = Stuff  vector:[4,5,6] str:"def"

--assignment is by reference... think of s and s3 as pointers
--pointing to the same stuff object
s3= s
"*********copy by ref**********"
s
s3
--changing one changes the other
s3.str="different string"
s
s3

"********use copy function********"
--use copy to make a copy of the object
s4=copy s2
s4.str="this is only changed in s4"
s2
s4
