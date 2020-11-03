extends Node

var helps = ["help: help message with all the commands",
			"sum [x] [y]: returns x+y",
			"sub [x] [y]: returns x-y",
			"mlt [x] [y]: returns x*y",
			"div [x] [y]: returns x/y",
			"lyrics [artist] [title]: returns the lyrics to the artist's title"]

const INVALID = "Invalid input!\n"
const INSUFFICIENT = "Incorrect argument ammount!\n"

signal call_request
signal return_input

func receive_input(input):
	emit_signal("return_input", process_input(input))

func process_input(input):
	var args = input.split(" ")
	
	var count = len(args)
	
	if count <= 0:
		return INVALID
	
	match (args[0]):
		"help":
			if count != 1:
				return INSUFFICIENT
			
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
			
			else:
				return INSUFFICIENT
		
		"sub":
			if count == 2 and args[1] == "help":
				return helps[2]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]):
					return INVALID
				return str(int(args[1]) - int(args[2]))
			
			else:
				return INSUFFICIENT
		
		"mlt":
			if count == 2 and args[1] == "help":
				return helps[3]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]):
					return INVALID
				return str(int(args[1]) * int(args[2]))
			
			else:
				return INSUFFICIENT
		
		"div":
			if count == 2 and args[1] == "help":
				return helps[4]
			
			elif count == 3:
				if !are_numbers(args[1], args[2]) or int(args[2]) == 0:
					return INVALID
				return str(int(args[1]) / int(args[2]))
			
			else:
				return INSUFFICIENT
		
		"lyrics":
			if count == 2:
				if args[1] == "help":
					return helps[5]
				else:
					return INSUFFICIENT
			
			elif count == 3:
				emit_signal("call_request", args[1], args[2])
		
			elif count > 3:
				for i in range(3, count):
					args[2] += "_" + args[i]
					
				emit_signal("call_request", args[1], args[2])
			else:
				return INSUFFICIENT


func are_numbers(x, y):
	if x.is_valid_integer() and y.is_valid_integer():
		return true
	
	return false


func _on_Master_input(input):
	receive_input(input)


func _on_HTTPRequest_return_value(input):
	emit_signal("return_input", "Letra encontrada!\n" + input)
