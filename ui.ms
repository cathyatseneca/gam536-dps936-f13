fn foo a b c d co =(
	for i=1 to d do(
		cylinder radius:a heightsegments:b sides:c height:d pos:[0,0,(i-1)*(d+2)]  wirecolor: co
	)
)
Utility dumptool "Test1"
(
	spinner a "Alpha" range:[10, 30, 20] type:#integer
	spinner b "Beta" range:[1,50,1] type:#integer
	slider c "Gamma" range:[10,40,20] ticks: 10 orient:#horizontal
	slider d "Delta" range:[0,100,10] ticks: 10 orient:#vertical
	colorpicker theColor "rainbow" color:[255,0,0]
	button done "Done" toolTip:""
	on done pressed  do(
		foo a.value b.value c.value d.value theColor.color
	)
	
)
