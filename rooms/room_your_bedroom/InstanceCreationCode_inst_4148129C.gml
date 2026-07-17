counter = 0;

interaction_code = function(){
    if counter == 0
    {
        cutscene_create()
		cutscene_dialogue(["* It's just your bed.",
		"* The blanket is a mess."])
		cutscene_play()
    }
    if counter >= 20
    {
        cutscene_create()
		cutscene_dialogue(["* You stare at your bed.", 
		"* Your body begins to feel heavy.", 
		"* You collapse and pass out. . ."])
		cutscene_func(fader_fade, [0, 1, 15])
		cutscene_play()
		save_get()
		save_set("PLOT", 1)
		cutscene_func(fader_fade, [15, 1, 0])
    }
    counter++;
}