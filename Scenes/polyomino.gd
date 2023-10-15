extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func init(width=4, height=4, inputMatrix=[]):
	if inputMatrix == []:
		inputMatrix = makeValidPolyomino(width, height)
		print(inputMatrix)
	
	
func makeValidPolyomino(width, height):
	var matrix = []
	for x in range(width):
		matrix.append([])
		matrix[x].resize(height)
		for y in range(height):
			matrix[x][y] = 0
	matrix[0][0] = 1
	var activeFilled = {[0,0]: true}
	var filled: float = 1
	while !(activeFilled.keys() == []):
		var candidates = {}
		for field in activeFilled.keys():
			if !(field[0] >= width-1):
				candidates[[field[0]+1,field[1]]] = true
			if !(field[1] >= height-1):
				candidates[[field[0],field[1]+1]] = true
			activeFilled.erase(field)
		for candidate in candidates:
			if (randf() > ((5*filled)/(3*width*height))):
				matrix[candidate[0]][candidate[1]] = 1
				filled += 1
				activeFilled[candidate] = true
				candidates.erase(candidate)
	return matrix
