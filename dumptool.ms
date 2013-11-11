--this function extracts the vertices myobj and stores it into an
-- array and returns it
fn GetVerts myobj =
(  vpos = #()
   for i = 1 to myobj.numverts do
   (
     vpos[i] = myobj.verts[i].pos
   )
   return vpos
)
-- this function extracts the faces (ie the vertices that define the
-- faces) from my obj and returns it
fn GetFaces myobj =
(  faces = #()
   for i = 1 to myobj.numfaces do
   (
  	faces[i] = getFace myobj i
   )
   return faces
)
-- this function calculates the normals on each face.  The normals
-- are taken by calculating the cross product between two vectors on
-- the face.
fn GetFaceNormals myobj numface=
(
  facenormals = #()
  for i = 1 to numface do
  (
    facenormals[i]= - (getFaceNormal myobj i)
  )
  return facenormals
)

-- this function returns an array that holds the average
-- normal for all vertices in vpos by averaging the normals of all
-- the faces that uses that vertex
fn GetAvgNormals faces vpos facenormals =
(
  facetable = #()
  avgnormals = #()
  for i = 1 to vpos.count do
  (
    facetable[i] = #()
  )
  for i = 1 to faces.count do
  (
  	append facetable[faces[i].x] i
	append facetable[faces[i].y] i
	append facetable[faces[i].z] i
  )
  for i = 1 to facetable.count do
  (
  	avgnormals[i] = facenormals[facetable[i][1]]
    for j = 2 to facetable[i].count do
	(
	  avgnormals[i] = avgnormals[i] + facetable[i][j]
	)
	avgnormals[i]/facetable[i].count;
  )
  return avgnormals
)
fn PrintVertex fs vpos whichvertex =
(
  	format "%" vpos[whichvertex].x to: fs
  	format " %" vpos[whichvertex].z to: fs
  	format " %" vpos[whichvertex].y to: fs

)
fn PrintUVVert fs myobj whichfacevert =
(
  uv = meshop.getMapVert myobj 1 whichfacevert
  d3dv = 1 - uv.y
  format " % %"  uv.x  d3dv to: fs
)
fn Writeout fname smooth myobj vpos faces facenormals =
(
  fs = OpenFile fname mode:"w"
  facetable = #()
  avgnormals = #()
  format "%\n" myobj.material.diffuseMap.filename to: fs
  format "D3DPT_TRIANGLELIST\n" to: fs
  format "1 1 1 1\n" to: fs
  format "%\n" (3 * faces.count) to: fs
  if smooth == true then
  (
	avgnormals = GetAvgNormals faces vpos facenormals
  )
  for i = 1 to faces.count do
  (
    mapface = meshop.getMapFace myobj 1 i
    PrintVertex fs vpos faces[i].x
	if smooth != true then
	(
	  format " % % %" facenormals[i].x facenormals[i].z facenormals[i].y to: fs
	)
	else
	(
	  PrintVertex fs avgnormals faces[i].x
	)
	PrintUVVert fs myobj mapface.x    
	format " 0\n" to: fs

	PrintVertex fs vpos faces[i].z
	if smooth != true then
	(
	  format " % % %" facenormals[i].x facenormals[i].z facenormals[i].y to: fs
	)
	else
	(
	  PrintVertex fs avgnormals faces[i].z
	)
	PrintUVVert fs myobj mapface.z
	format " 0\n" to: fs
	
	PrintVertex fs vpos faces[i].y
	if smooth != true then
	(
	  format " % % %" facenormals[i].x  facenormals[i].z facenormals[i].y to: fs
	)
	else
	(
	  PrintVertex fs avgnormals faces[i].y
	)
	PrintUVVert fs myobj mapface.y
	format " 1\n" to: fs
  )
)

fn dumpdata fname smooth =
( 
  faces = #()
  vpos = #()
  facenormals = #()
  uvs = #()
  myobj = $
  vpos = GetVerts myobj
  print vpos.count
  faces = GetFaces myobj
  print faces.count
  facenormals = GetFaceNormals myobj faces.count
  Writeout fname smooth myobj vpos faces facenormals
)
Utility dumptool "Cathy's dump tool"
(
	rollout nofileerror "Error!" width:160 height:67
	(
	  label errmsg "Output filename must not be empty" pos:[25,20] width:102 height:39
	)
 	editText fnamefield "" pos:[74,18] width:78 height:17
	label filelabel "Filename:" pos:[8,20] width:51 height:16
	checkbox smoothcheck "smooth" pos:[10,53] width:107 height:16
	button done "Done" pos:[23,87] width:116 height:25 toolTip:""
	on done pressed  do(
	 	if fnamefield.text == "" then
		(
		   createDialog nofileerror
		)
		else
		(
	  	   dumpdata fnamefield.text smoothcheck.checked
		)
	)
	
)
