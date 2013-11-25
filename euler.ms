c = $toopy
c2 = $cone2

rotationObject = eulerAngles 45 30 0

r2 = eulerAngles 0 30 0
r3 = eulerAngles 45 0 0
r4 = eulerAngles 0 0 0

rotate c rotationObject
rotate c2 r2
rotate c2 r3

c2.rotation = r4