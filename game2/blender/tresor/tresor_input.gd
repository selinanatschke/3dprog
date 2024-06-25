extends CanvasLayer

onready var labels: Label = get_node("/root/Main/TresorInput/TextureRect/Digits")
onready var tresor_open: Spatial = get_node("/root/Main/Room1/Tresor-offen")
onready var tresor_closed: Spatial = get_node("/root/Main/Room1/Tresor")
var code =[]

onready var layer4: TextureRect = get_node("/root/Main/Inventory/4")
onready var layer7: TextureRect = get_node("/root/Main/Inventory/7")
onready var layer6: TextureRect = get_node("/root/Main/Inventory/6")
onready var layer2: TextureRect = get_node("/root/Main/Inventory/2")

func _on_TextureButton_pressed():
	labels.text = ""
	self.visible = false
	$"pressKeySound".play()


func _on_1_pressed():
	addLabelText("1")
	$"pressKeySound".play()
	
func _on_2_pressed():
	addLabelText("2")
	$"pressKeySound".play()

func _on_3_pressed():
	addLabelText("3")
	$"pressKeySound".play()

func _on_4_pressed():
	addLabelText("4")
	$"pressKeySound".play()

func _on_5_pressed():
	addLabelText("5")
	$"pressKeySound".play()

func _on_6_pressed():
	addLabelText("6")
	$"pressKeySound".play()

func _on_7_pressed():
	addLabelText("7")
	$"pressKeySound".play()

func _on_8_pressed():
	addLabelText("8")
	$"pressKeySound".play()

func _on_9_pressed():
	addLabelText("9")
	$"pressKeySound".play()

func addLabelText(s: String):
	if(labels.text.length() < 4):
		labels.text += s
	
		print("enough code: ", labels.text)
		if(labels.text == "4762"):
			print("correct code")
			tresor_open.visible = true
			tresor_closed.visible = false
			self.visible = false
			
			layer4.visible = false
			layer6.visible = false
			layer7.visible = false
			layer2.visible = false
			$"tresorOpenSound".play()
