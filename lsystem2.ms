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
		rotate c t.rot
	)
)

fn drawPlus t a = (
	if not t.rotset then(
		t.rot=eulerAngles 0 0 a
		t.rotset=true
	)
	
	plus = eulerAngles 0  0 a
	t.heading = t.heading * (plus as matrix3)
)
fn drawMinus t a = (
	if not t.rotset then(
		t.rot=eulerAngles 0 0 -a
		t.rotset=true
	)
	
	plus = eulerAngles 0  0 -a
	t.heading = t.heading * (plus as matrix3)
)
fn drawAmpersand t a = (
	if not t.rotset then(
		t.rot=eulerAngles -a 0 0
		t.rotset=true
	)
	
	plus = eulerAngles -a 0 0
	t.heading = t.heading * (plus as matrix3)
)
fn drawHat t a = (
	if not t.rotset then(
		t.rot=eulerAngles a 0 0
		t.rotset=true
	)
	
	plus = eulerAngles a 0 0
	t.heading = t.heading * (plus as matrix3)
)

fn drawSlash t a = (
	if not t.rotset then(
		t.rot=eulerAngles 0 a 0
		t.rotset=true
	)
	
	plus = eulerAngles 0 a 0
	t.heading = t.heading * (plus as matrix3)
)
fn drawBackSlash t a = (
	if not t.rotset then(
		t.rot=eulerAngles 0 -a 0
		t.rotset=true
	)
	
	plus = eulerAngles 0 -a 0
	t.heading = t.heading * (plus as matrix3)
)


fn LSystem = (
	t=Turtle position:[0,0,0] heading:[0,0,1]
	drawF t
	drawSlash t 90
	drawF t
	
)

LSystem()