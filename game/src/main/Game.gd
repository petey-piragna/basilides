extends Node2D


# generate 365 heavens. each heaven is represented by a nested array of four values. 

# the first is a decimal representation of a four digit binary number, where a 1
# represents an available level, depending on its place. for example, a value of 1 
# would mean only level one is available, 3 would repesent that both levels 1 and 2
# are available, 6 would represent that levels 2 and 3 are available

# the second, third, and fourth represent the strength of the virtues, prrinces,
# and angels, respectively. these are in for level generation.



func generate_heavens():
	print("generating heavens")
	var heaven_stack = []
	var heavens = [0, 50, 50, 50]
	var heaven_counter = 365
	while heaven_counter > 0:
		randomize()
		heavens[0] = randi() % 15
		heavens[1] = _random_influence(heavens[1])
		heavens[2] = _random_influence(heavens[2])
		heavens[3] = _random_influence(heavens[3])
		heaven_stack.push_back(heavens.slice(0, heavens.size()))
		heaven_counter = heaven_counter - 1 

func _random_influence(input):
	randomize()
	var influence = randi() % 16 - 8
	if input + influence > 100 || input + influence < 0:
		influence = influence * -1
	input = input + influence
	return input
