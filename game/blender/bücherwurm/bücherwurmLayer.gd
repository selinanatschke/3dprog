extends CanvasLayer

onready var sprechblaseLabel: Label = get_node("/root/Main/BücherwurmLayer/Sprechblase/Label")
onready var gedankenblaseLabel: Label = get_node("/root/Main/BücherwurmLayer/Gedankenblase/Label")
onready var sprechblase: TextureButton = get_node("/root/Main/BücherwurmLayer/Sprechblase")
onready var gedankenblase: TextureButton = get_node("/root/Main/BücherwurmLayer/Gedankenblase")
onready var buecherwurm: TextureRect = get_node("/root/Main/BücherwurmLayer/Bücherwurm")
onready var close: TextureButton = get_node("/root/Main/BücherwurmLayer/Close")
onready var bookWormSound: AudioStreamPlayer = get_node("/root/Main/Buecherwurm/bookWormSound")

func _on_Sprechblase_pressed():
	if GlobalVariables.steps == 0:
		sprechblase.visible = false
		buecherwurm.visible = false
		bookWormSound.stop()
		$"bubbleSound".play()
		gedankenblase.visible = true
		
	if GlobalVariables.steps == 1:
		addSpeechbubbleText(" … kannst du das bitte machen? Damit lässt sich nämlich das Buch auf dem Tisch öffnen und darin steht die Anleitung, um die KI zu reparieren.")
		close.visible = true

func _on_Close_pressed():
	self.visible = false
	bookWormSound.stop()
	$"pressKeySound".play()
	addSpeechbubbleText("Ah gut, dass du da bist. Hier geht alles drunter und drüber! Kannst du gleich mal mitkommen und mir helfen?")

func _on_Gedankenblase_pressed():
	if GlobalVariables.steps == 0:
		bookWormSound.play()
		gedankenblase.visible = false
		sprechblase.visible = true
		buecherwurm.visible = true
		addSpeechbubbleText("Ah, okay! Ich sehe du hast deine Erinnerung verloren… Wir sind hier in einer Bibliothek und die KI ist kaputt. Du musst helfen sie zu reparieren. Oh nee, eigentlich wollte ich dir gerade den Schlüssel geben, aber der ist mir anscheinend vorhin aus der Tasche gefallen, jetzt musst du ihn suchen.")
		GlobalVariables.steps += 1

func addSpeechbubbleText(s: String):
	sprechblaseLabel.text = s
