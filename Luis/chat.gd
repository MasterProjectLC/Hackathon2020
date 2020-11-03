extends Control
 
var resp
var backlog = ""

signal input

func _on_LineEdit_text_entered(new_text):
	print(new_text)
	add_backlog(new_text)
	emit_signal("input", new_text)
	$LineEdit.set_text("")
	
	$Qwerty.set_text("Olá, eu sou o Qwerty!")


func add_backlog(new):
	if new == null:
		print("erro")
		return
	
	backlog += "\n" + new
	$Fala.set_text(str(backlog))
