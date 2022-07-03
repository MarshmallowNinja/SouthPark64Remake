extends HTTPRequest
var responsecode = 1
var net = HTTPClient.new()
enum NetSpeed {Unplayable, Laggy, Slow, Decent, Good, Fast, Stellar}

func _ready():
	$".".request("https://marshmallowstudios.net/")
	print($".".get_http_client_status())
	


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(var2str(response_code))
	print($".".get_http_client_status())
