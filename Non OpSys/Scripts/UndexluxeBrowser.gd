extends Control
var text
var url

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request("https://godotengine.org")


func _on_http_request_request_completed(result, response_code, headers, body):
	var html = body.get_string_from_utf8()
	$RichTextLabel.text = innerHTML("body", html)
	print(innerHTML("title", html))


func _on_button_pressed():
	text = $HBoxContainer/LineEdit.text
	if !"https://" in $HBoxContainer/LineEdit.text:
		$HTTPRequest.request("https://" +  str($HBoxContainer/LineEdit.text))
		url = "https://" + text
		
	else:
		$HTTPRequest.request($HBoxContainer/LineEdit.text)
		url = $HBoxContainer/LineEdit.text
	$HBoxContainer/LineEdit.text = url


func innerHTML(tag, html, default = ""):
	var regex = RegEx.new()
	regex.compile("<" + tag + ">(.|\n)*?</" + tag + ">")
	var result = regex.search(html)
	if result:
		return result.get_string().replace("<" + tag + ">", '').replace("</" + tag + ">", '')
	return default
