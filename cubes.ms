fn generateCube n =(
  for i=1 to n do(
    x = random -40 40
    y = random -40 40
    z = random -40 40
    sz = random 10 20
    if sz < 13 then(
      b=box length:sz width:sz height:sz pos:[x,y,z]
      b.wirecolor = green
    )
    else(
      b=box length:sz width:sz height:sz pos:[x,y,z]
      co = random 0 50
      b.wirecolor = color co co co
    )
  )
)
generateCube 1000