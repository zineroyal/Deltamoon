counter = 0
if counter == 0 {
	interaction_code=function(){
		cutscene_create()
		cutscene_dialogue([
		"* The door is locked. . . ?",
		"* You turn the knob desperately. . .",
		"* You kick the door...",
		"* You punch the door...",
		"* You scream at the door...",
		"* But no sound left your mouth...",
		"* You let go of the door..."])
		cutscene_play()
		counter += 1
	}
} else if counter >= 1 {
		interaction_code=function(){
		cutscene_create()
		cutscene_dialogue("* You stare blankely at the door. . .")
		cutscene_play()
		}
}