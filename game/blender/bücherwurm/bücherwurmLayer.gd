extends CanvasLayer

onready var sprechblaseLabel: Label = get_node("/root/Main/BücherwurmLayer/Sprechblase/Label")
onready var gedankenblaseLabel: Label = get_node("/root/Main/BücherwurmLayer/Gedankenblase/Label")
onready var sprechblase: TextureButton = get_node("/root/Main/BücherwurmLayer/Sprechblase")
onready var gedankenblase: TextureButton = get_node("/root/Main/BücherwurmLayer/Gedankenblase")
onready var buecherwurm: TextureRect = get_node("/root/Main/BücherwurmLayer/Bücherwurm")

func _on_Sprechblase_pressed():
	if GlobalVariables.steps == 0:
		sprechblase.visible = false
		buecherwurm.visible = false
		gedankenblase.visible = true
		
	if GlobalVariables.steps == 1:
		addSpeechbubbleText(" ... kannst du das bitte machen?, und damit dann das Buch auf dem Tisch öffnen. Das ist nämlich die Anleitung um die Ki zu reparieren.")

func _on_Close_pressed():
	self.visible = false
	addSpeechbubbleText("Ah gut dass du da bist hier geht alles drunter und drüber, kannst du gleich mal mitkommen und mir helfen")

func _on_Gedankenblase_pressed():
	if GlobalVariables.steps == 0:
		gedankenblase.visible = false
		sprechblase.visible = true
		buecherwurm.visible = true
		addSpeechbubbleText("Ah, okay ich sehe du hast deine Erinnerung verloren.. Wir sind hier in einer bib und die ki ist kaputt, und du musst helfen sie zu reparieren. Oh nee, eigentlich wollte ich dir gerade den Schlüssel geben, aber der ist mir anscheinend vorhin  aus der Tasche gefallen, jetzt musst du den suchen!")
		GlobalVariables.steps += 1

func addSpeechbubbleText(s: String):
	sprechblaseLabel.text = s
