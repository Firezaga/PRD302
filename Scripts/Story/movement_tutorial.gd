extends Node2D

var DiaCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Midground/PlayerTown.MovementTutorial()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.DiaFinished && DiaCount == 0):
		Global.DiaFinished = false
		Dia2()
	if (Global.DiaFinished && DiaCount == 1):
		Global.DiaFinished = false
		Dia3()
	if (Global.DiaFinished && DiaCount == 2):
		Global.DiaFinished = false
		Dia4()
	if (Global.DiaFinished && DiaCount == 3):
		Global.DiaFinished = false
		Dia5()
	if (Global.DiaFinished && DiaCount == 4):
		Global.DiaFinished = false
		Dia6()
	if (Global.DiaFinished && DiaCount == 5):
		Global.DiaFinished = false
		Dia7()
	
	#$NPC.rotation -= 0.1 * delta
	$Midground/NPC/Sprite2D.rotation -= 0.12 * delta
	$Midground/NPC/Sprite2D2.rotation -= 0.09 * delta
	$Midground/NPC/Sprite2D3.rotation -= 0.11 * delta


func _on_area_2d_area_entered(area):
	$Midground/PlayerTown.position.x = 1112
	$Midground/PlayerTown.position.y = -133


func _on_npc_area_area_entered(area):
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "THERE ARE FOUR PEOPLE CAMPING AROUND EACH OTHER. ONE IS A GIRL IN WHITE, THAT SEEMS TO BE EYEING ON ANOTHER GIRL IN RED THAT IS DEEP IN AN ARGUMENT. THE THIRD IS A GRIM-LOOKING BARBARIAN WHO HOLDS A LARGE WEAPON, ARGUING WITH THE RED GIRL, AND THE LAST IS A MAN WHO LOOKS AS IF HE'S TRYING TO HIDE HIS IDENTITY, THOUGH HIS BEARD POKES OUT OF HIS THICK HOOD.~BARBARIC MAN: I'm telling you that we need more power to beat them! We're just grabbing small meat after small meat to get better!~GIRL IN RED: And I'm telling YOU that YOU need to wait for ME to distract them for YOU to attack their back! What's so hard about that?~BARBARIC MAN:  The hard part is keeping you safe! Do you know how many times you were hurt just because you wanted to keep them looking at you!? Clarico! How many times did you heal her?~GIRL IN WHITE: Ugh... I don't know... about forty times... I think? Either way, Beoul has a point. Alcora, we can't afford you being injured every time you want to make an opening; if you get hurt, I have to pick you back up.~BEARDED BOY...?: Perhaps it would make sense for them to be struck by their own attack, like me giving them a dose of... poison to make them hurt themselves trying to hit us? You know, the thing I've been doing the whole time?~GIRL IN WHITE: Actually, I agree with Verity; if we weaken them with Verity's ability, that is, in and of itself, a weak point.~BARBARIC MAN: Wait.~BARBARIC MAN: Something's coming.%"
	Global.LOAD_dialogue()


func Dia2():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "They seemingly noticed you. They start releasing power in response.~CLARICO: S-stay back! You don't want to do this!~ALCORA: Yeah! You're outmatched! What'cha gonna do? HURL AT US?~EXTOR: Wait.~ALCORA: HUH, IT TALKS!?~BEOUL: YOU- YOU THINK TALKING IS GOING TO DO ANYTHING?~EXTOR: Just... wait.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia3():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "The four look bamboozled. The red girl is shocked, the white one lowered her weapon already, and the bearded man... who looks far too young to have a beard, has lowered their energy. The only one to have yet to do so, is the barbaric man in front of you.~BEOUL: Come on! Try and hit us, see if you even can!~CLARICO: Beoul, stop!~BEOUL: What? You want us to die here and now? What if this... person...?~CLARICO: Please, lower your energy. I don't think this person poses a threat to us. In fact...%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia4():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "Clarico approaches you and starts examining you in detail. Alcora, the girl in red, follows her. She still seems wary and has a weapon on her right hand. Clarico closed her eyes...~CLARICO: Hmm...~ALCORA: Anything, Clarico? If this thing suddenly kills us, I'm forever putting you out of my afterlife.~Clarico is still deep in thought...~ALCORA: Clarico? Don't you dare say that you've been possessed!%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia5():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "Alcora draws her weapon and threatens you with it.~ALCORA: You! What have you done to her!? Speak up, damn it!~EXTOR: I didn't do anything.~Clarico finishes her thought process... and then...~CLARICO: ALCORA, STOP IT. Put your weapon down.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia6():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "Alcora puts away her weapon, still angry.~ALCORA: Fine, you've got some explaining to do. Especially after your mini \"zombie\" arc.~CLARICO: Please, come with me. And everyone, don't worry; this person is safe.~BEOUL: What is that supposed to mean?~VERITY: It means that he's invited, and he's already been accepted. Certainly a record for the group we have here... considering our history.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia7():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "You group up with the four. Beoul seems attentive to you, waiting for you to strike, though he realizes that you aren't a threat. Alcora is also attentive to you, though she put down her weapon after a while. Verity, on the other hand is relaxed, while Clarico is deep in thought... again.~CLARICO: Everyone... I am sorry for worrying you.~ALCORA: Well, what is it? Spit it out already!~CLARICO: It concerns this person before us.~BEOUL: What, we kicking this guy out already?~VERITY: Very funny, wait for her to finish, bucko.~CLARICO: I believe, it will be prudent for us to have him with our journey.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia8():
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "^The three are in shock; Verity tries to maintain his shock (raising his eyebrows) while Alcora and Beoul let out a huge...~ALCORA AND BEOUL: WHAT!!!!???~CLARICO: Please, allow me to explain.~CLARICO:  As you know, I am a cleric who studied about history. Particularly about the past, present and future religions.~CLARICO: I believe, the religious entity known simply as Moat have blessed us with a... solution.~CLARICO: The person before us holds a grand purpose; to destroy threats that seek to eliminate all we know, cherish and love. This person will not only be the key to our journey, but also be our grand weapon.~ALCORA: Grand weapon?~CLARICO: Perhaps I misconstrued, but their strength will be unmatchable, and we must assist them at all costs."
	await Global.LOAD_dialogue()
	DiaCount += 1
