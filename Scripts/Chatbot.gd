extends Node

var helps = ["help: help message with all the commands",
			"sum [x] [y]: returns x+y",
			"sub [x] [y]: returns x-y",
			"mlt [x] [y]: returns x*y",
			"div [x] [y]: returns x/y",]

const INVALID = "Invalid input!\n"

func receive_input(input):
	var args = input.split(" ")
	
	var count = len(args)
	
	if count <= 0:
		return null
	
	match (args[0]):
		"help":
			var s = ""
			for i in helps:
				s += i + "\n"
			
			return s
			
		"sum":
			if count == 2 and args[1] == "help":
				return helps[1]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]):
					return INVALID
				return str(int(args[1]) + int(args[2]))
		
		"sub":
			if count == 2 and args[1] == "help":
				return helps[2]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]):
					return INVALID
				return str(int(args[1]) - int(args[2]))
		
		"mlt":
			if count == 2 and args[1] == "help":
				return helps[3]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]):
					return INVALID
				return str(int(args[1]) * int(args[2]))
		
		"div":
			if count == 2 and args[1] == "help":
				return helps[4]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]) or int(args[2]) == 0:
					return INVALID
				return str(int(args[1]) / int(args[2]))
		
		"lyrics":
			if count == 2 and args[1] == "help":
				return helps[5]
			
			elif count == 3:
				emit_signal("call_request", args[1], args[2])


func are_numbers(x, y):
	if x.is_valid_integer() and y.is_valid_integer():
		return true
	
	return false
