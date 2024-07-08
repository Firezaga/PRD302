extends Node2D

var DiaCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Midground/PlayerTown.MovementTutorial()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#$NPC.rotation -= 0.1 * delta
	$Midground/NPC/Sprite2D.rotation -= 0.12 * delta
	$Midground/NPC/Sprite2D2.rotation -= 0.09 * delta
	$Midground/NPC/Sprite2D3.rotation -= 0.11 * delta


func _on_area_2d_area_entered(area):
	$Midground/PlayerTown.position.x = 1112
	$Midground/PlayerTown.position.y = -133


func _on_npc_area_area_entered(area):
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = " THERE ARE FOUR PEOPLE CAMPING AROUND EACH OTHER. ONE IS A GIRL IN WHITE, THAT SEEMS TO BE EYEING ON ANOTHER GIRL IN RED THAT IS DEEP IN AN ARGUMENT. THE THIRD IS A GRIM-LOOKING BARBARIAN WHO HOLDS A LARGE WEAPON, ARGUING WITH THE RED GIRL, AND THE LAST IS A MAN WHO LOOKS AS IF HE'S TRYING TO HIDE HIS IDENTITY, THOUGH HIS BEARD POKES OUT OF HIS THICK HOOD.~BARBARIC MAN: I'm telling you that we need more power to beat them! We're just grabbing small meat after small meat to get better!~GIRL IN RED: And I'm telling YOU that YOU need to wait for ME to distract them for YOU to attack their back! What's so hard about that?~BARBARIC MAN:  The hard part is keeping you safe! Do you know how many times you were hurt just because you wanted to keep them looking at you!? Clarico! How many times did you heal her?~GIRL IN WHITE: Ugh... I don't know... about forty times... I think? Either way, Beoul has a point. Alcora, we can't afford you being injured every time you want to make an opening; if you get hurt, I have to pick you back up.~BEARDED BOY...?: Perhaps it would make sense for them to be struck by their own attack, like me giving them a dose of... poison to make them hurt themselves trying to hit us? You know, the thing I've been doing the whole time?~GIRL IN WHITE: Actually, I agree with Verity; if we weaken them with Verity's ability, that is, in and of itself, a weak point.~BARBARIC MAN: Wait.~BARBARIC MAN: Something's coming.%"
	Global.LOAD_dialogue()
	

