extends HTTPRequest

signal return_value

func _ready():
	connect("request_completed", self, "_on_request_completed")


func _on_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		print(json.result["lyrics"])
		emit_signal("return_value", json.result["lyrics"])
	else:
		print("Letras não encontradas =(")
		emit_signal("return_value", "Letras não encontradas =(")


func ask(artist, title):
	# tratamento
	artist.replace(" ","_")
	title.replace(" ","_")
	
	request("https://api.lyrics.ovh/v1/" + artist + "/" + title)


func _on_Chatbot_call_request(artist, title):
	ask(artist, title)
