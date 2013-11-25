struct Turtle(
	position, 
	heading,
	rot,
	rotset=false
)

struct MyStack(
	thestack = #(),
	top=1,
	fn isEmpty = (
		rc = false
		if top == 1 do
		    rc=true
		rc
	),
	fn pushItem item =( 
		print item
		thestack[top] = item
		top=top+1
	),
	fn topItem = (
		rc=false
		if top != 1 do(
			rc=thestack[top-1]
		)
		rc
	),
	fn popItem =(
		if top!=1  do(
			top=top-1
		)
	)
)
fn drawF t =(
	c=cone radius1:5 radius2:5 height:40 heightsegs:1 sides:8 position:t.position
	t.position=t.position+t.heading*40
	if t.rotset do(
		a = eulerAngles t.rot.x t.rot.y t.rot.z
		rotate c a
	)
)

fn drawPlus t a = (
	if not t.rotset then(
		t.rot=[0,0,a]
		t.rotset=true
	)
    else(
		t.rot+=[0,0,a]
	)	
	plus = eulerAngles 0  0 a
	t.heading = t.heading * (plus as matrix3)
)
fn drawMinus t a = (
	if not t.rotset then(
		t.rot=[0,0,-a]
		t.rotset=true
	)
    else(
		t.rot+=[0,0,-a]
	)	
	plus = eulerAngles 0  0 -a
	t.heading = t.heading * (plus as matrix3)
)
fn drawAmpersand t a = (
	if not t.rotset then(
		t.rot=[-a,0,0]
		t.rotset=true
	)
	else(
		t.rot+=[-a,0,0]
	)
	plus = eulerAngles -a 0 0
	t.heading = t.heading * (plus as matrix3)
)
fn drawHat t a = (
	if not t.rotset then(
		t.rot=[a,0,0]
		t.rotset=true
	)
    else(
		t.rot+=[a,0,0]
	)	
	plus = eulerAngles a 0 0
	t.heading = t.heading * (plus as matrix3)
)

fn drawSlash t a = (
	if not t.rotset then(
		t.rot=[0,a,0]
		t.rotset=true
	)
	else(
		t.rot+=[0,a,0]
	)
	
	plus = eulerAngles 0 a 0
	t.heading = t.heading * (plus as matrix3)
)
fn drawBackSlash t a = (
	if not t.rotset then(
		t.rot=[0,-a,0]
		t.rotset=true
	)
    else(
		t.rot+=[0,-a,0]
	)
	plus = eulerAngles 0 -a 0
	t.heading = t.heading * (plus as matrix3)
)


fn LSystem = (
	t=Turtle position:[0,0,0] heading:[0,0,1]
    drawSlash t 90
	drawF t
	drawBackSlash t 90
	drawF t
	drawBackSlash t 90
	drawF t
	drawSlash t 90
	drawAmpersand t 90
	drawF t
	drawHat t 90
	drawSlash t 90
	drawF t
	t
	drawAmpersand t 90
	drawAmpersand t 90
	t
	drawF t
	drawBackSlash t 90
	t
	drawF t
	drawBackSlash t 90
)

LSystem()
