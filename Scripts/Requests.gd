extends CanvasLayer

signal return_value

func _ready():
	$Requests.connect("request_completed", self, "_on_request_completed")

func _on_Button_pressed():
	$Requests.request("https://api.lyrics.ovh/v1/Coldplay/Paradise")


func _on_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		print(json.result["lyrics"])
		emit_signal("return_value", json.result["lyrics"])
	else:
		print("Lyrics não encontradas =(")
		emit_signal("return_value", "Lyrics não encontradas =(")


func ask(artist, title):
	# tratamento
	artist.replace(" ","_")
	title.replace(" ","_")
	
	$Requests.request("https://api.lyrics.ovh/v1/" + artist + "/" + title)
