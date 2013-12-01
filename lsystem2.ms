struct Turtle(
	position, 
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
	c=cone radius1:5 radius2:1 height:40 heightsegs:1 sides:8 position:t.position
	if t.rotset do(
		rotate c t.rot
	)
    tr=c.transform
	p=[0,0,40]*tr
	t.position= p


)

fn drawPlus t a = (
	q=quat a [0,0,1]

	if not t.rotset then(
		t.rot=q
		t.rotset=true
	)
    else(
		t.rot=t.rot * q
	)	
)
fn drawMinus t a = (
	q=quat -a [0,0,1]

	if not t.rotset then(
		t.rot=q
		t.rotset=true
	)
    else(
		t.rot=t.rot * q
	)	

)
fn drawAmpersand t a = (
	q=quat -a [1,0,0]
	if not t.rotset then(
		t.rot=q
		t.rotset=true

	)
    else(
		t.rot=t.rot * q
	)	

)
fn drawHat t a = (
	q=quat a [1,0,0]

	if not t.rotset then(
		t.rot=q
		t.rotset=true
	)
    else(
		t.rot=t.rot * q
	)	

)

fn drawSlash t a = (
	q=quat a [0,1,0]
	if not t.rotset then(
		t.rot=q
		t.rotset=true
	)
	else(
		t.rot= t.rot * q
	)
)
fn drawBackSlash t a = (
	q=quat -a [0,1,0]
	if not t.rotset then(
		t.rot=q
		t.rotset=true
	)
    else(
		t.rot=t.rot * q
	)
)



fn LSystem = (
        t=Turtle position:[0,0,0]
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
        drawAmpersand t 90
        drawAmpersand t 90
        drawF t
        drawBackSlash t 90
        drawF t
        drawBackSlash t 90
)

LSystem()