for i=1 to 1000 do (
  x= random -50 50
  y= random -50 50
  h= random 15 25
  an= random 5.0 40.0
  g = random 128 256
  r = random 0 128
  c=cone radius1:0.5 height:h sides:5 pos:[x,y,0]
  c.wirecolor= color r g 0
  addmodifier c (Bend angle:an)

)

