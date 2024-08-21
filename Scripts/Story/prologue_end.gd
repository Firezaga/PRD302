extends Node2D

var DiaCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.DiaBackground = "res://Art/StoryScenes/Act0/Act0BG.png"
	Global.DiaText = "A FEW HOURS LATER, EVERYONE WAKES FROM THEIR SLEEP. CLARICO IS REFRESHED AND IS PREPARING A SPEECH TO THE OTHERS. ALCORA IS WAITING AND SUPPORTING HER. THE OTHER TWO ARE REGAINING THEIR ENERGY.~ALCORA (serious): Well, are you ready?~CLARICO: Give me another minute, I'm still in the process of waking up.~ALCORA: Take your time.%"
	Global.LOAD_dialogue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.DiaFinished && DiaCount == 0):
		Global.DiaFinished = false
		Dia()
	if (Global.DiaFinished && DiaCount == 1):
		Global.DiaFinished = false
		Dia1()
	if (Global.DiaFinished && DiaCount == 2):
		Global.DiaFinished = false
		Dia2()
	if (Global.DiaFinished && DiaCount == 3):
		Global.DiaFinished = false
		Dia3()
	if (Global.DiaFinished && DiaCount == 4):
		Global.DiaFinished = false
		Dia4()
	if (Global.DiaFinished && DiaCount == 5):
		Global.DiaFinished = false
		Global.GOTO_town_test()



func Dia():
	Global.DiaBackground = "res://Art/StoryScenes/Act2/Act 2 S5.5.png"
	Global.DiaText = "^YOU APPROACH THE TWO.~EXTOR: Are you okay?~ALCORA: She said to give her a minute. Might as well do something else while we wait.~ALCORA: Oh, and she said you were amazing. Exceeded her expectations by a cosmic mile.~@^I'm like that.^It was nothing.^Thanks^ALCORA: For a second there, I was expecting you to destroy reality or something!%^ALCORA: If there's anything smaller, I wanna see you tear it to shreds!%^ALCORA: Heh... makes me wish I was as strong as you.%^"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia1():
	Global.DiaBackground = "res://Art/StoryScenes/Act2/Act 2 S5.5.png"
	Global.DiaText = "Clarico gets up then walks towards Alcora and Extor.~CLARICO: Okay, I'm ready. Alcora, could you get the others?~ALCORA: On it, ma'am!~Alcora runs straight to the other two.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia2():
	Global.DiaBackground = "res://Art/StoryScenes/Act2/Act 2 S6.png"
	Global.DiaText = "CLARICO: Extor, may I have a word with you?~CLARICO: I know all of this is really sudden, but I want to ask you to take on leadership.~CLARICO: Your power is beyond what any of us can muster, though I noticed it was because we acted first, then you followed.~CLARICO: But I feel the primary reason being that you will have some sort of direction, and we will follow you.~CLARICO: Now that we know you are a... blessing from Moat, we shall help you take on your quest to... avert annihilation.~CLARICO:  We all wish to live, and the imminent end will soon arrive. Without you, I don't think we'll make it.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia3():
	Global.DiaBackground = "res://Art/StoryScenes/Act2/Act 2 S6.png"
	Global.DiaText = "The three came rushing to Clarico.~BEOUL: So? Will you be okay?~CLARICO: Yes, thank you. I want to tell you guys that I think we should have a leader...~ALCORA: I know where this is going.~Alcora is looking at you.~VERITY: Hmm... I wonder who's it gonna be?~Verity is looking at you.~BEOUL: Lemme guess... \"the chosen one\", eh?~...Everyone is looking at you. Literally.~CLARICO:  And it looks like we have our leader! Extor, from now on we are under your command!~EXTOR: Okay.~ALCORA: We are totally not getting ripped to shreds with you!~VERITY: Can agree, even though you made me lose my beard, we're safer with you.~BEOUL: You care so much about your beard, you'd get Clarico killed for that?~VERITY: What the- No! I didn't mean it like that! It was a joke!~BEOUL: way, definitely Extor for our leader.~CLARICO: Now that we have an agreement, it's time for you to decide, Extor. What shall we do now?~EXTOR: We go back in there...~EXTOR: Find their homes...~EXTOR: Then rip them to shreds.~CLARICO: In that case... I have a relative location of where they are. This might sound personal again but I know they linger around my hometown.~ALCORA: That's around the bottom left... I think? We're not too far away from Midtown but I think this is a bit far away from us.~BEOUL: On another note, I also had a bunch of bastards chase me in my town.~VERITY: Didn't we cover that a while ago? Everyone's homes were ravaged when that thing came on.~CLARICO: Actually we haven't, but it seems like all our homes were in fact destroyed.~VERITY: Okay then, well I don't mind tackling the girls hometown first.~BEOUL: Yeah, I'm down.~ALCORA: Then it's settled. Extor, I'll point you the way to the place we talked about.~CLARICO: Before we do that, feel free to get some enemies to fight so we have a better understanding of what we can do with you. I believe some practice would benefit us.~EXTOR: Let's go.%"
	await Global.LOAD_dialogue()
	DiaCount += 1


func Dia4():
	Global.DiaBackground = "res://Art/StoryScenes/Act2/Act 2 S7.png"
	Global.DiaText = "FROM THIS POINT ON THE GAME WORLD IS YOURS TO EXPLORE ON YOUR OWN.~IT WOULD BE WISE TO INVGESTIGATE THE PORTAL WHERE YOU FIRST ENCOUNTERED YOUR COMPANIONS.%"
	await Global.LOAD_dialogue()
	DiaCount += 1
	
