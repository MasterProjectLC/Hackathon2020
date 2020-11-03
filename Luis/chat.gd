extends Control

func _on_LineEdit_text_entered(new_text):
	print(new_text)
	$LineEdit.set_text("")
	if new_text:
		pass

func _on_LineEdit_text_changed(new_text):
	pass
