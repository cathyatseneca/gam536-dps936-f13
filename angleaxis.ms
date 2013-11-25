--before you start, make a cone so that you can tell which way you are facing
c=$toopy
--max has 3 ways to specify rotations, this one uses euler angles.
--each number represents rotation around the x, y and z axis
--thus in example below it is 30 degrees around the y axis (remember, max is z-up)
rot = angleAxis  90 [0,1,0]

rotate c rot