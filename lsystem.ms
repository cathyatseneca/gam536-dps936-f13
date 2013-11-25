struct Turtle(
	position, heading
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
	cone radius1:5 radius2:5 height:20 heightsegs:1 sides:8 position:t.position
)

fn doDraw =(
	t=Turtle position:[0,0,0] heading:[0,0,1]
	drawF t
	drawF t
)

doDraw()