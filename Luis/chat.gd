extends Control
 
var resp

func _on_LineEdit_text_entered(new_text):
	print(new_text)
	$Fala.set_text(str(new_text))
	$LineEdit.set_text("")
	
	if new_text == "a":
		$Qwerty.set_text("a")
	else:
		$Qwerty.set_text("Erro!")
