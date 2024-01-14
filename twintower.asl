//A Game, Creating twin towers with balancing
//Felicien2B and Jean20B

state("ttower") {
    uint level: 0x24454, 0x38, 0x8F0;
    uint state: 0x24454, 0x28, 0xB90;
}

startup {
    vars.levels = new[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30, 35, 40 };

	//Splits
	settings.Add("transition", false, "Enable transitions");
	settings.Add("level1", true, "Level 1");
	settings.Add("level2", true, "Level 2");
    settings.Add("level3", true, "Level 3");
	settings.Add("level4", true, "Level 4");
    settings.Add("level5", true, "Level 5");
	settings.Add("level6", true, "Level 6");
    settings.Add("level7", true, "Level 7");
	settings.Add("level8", true, "Level 8");
    settings.Add("level9", true, "Level 9");
	settings.Add("level10", true, "Level 10");
    settings.Add("allclear", true, "All level clear");
	settings.Add("level15", false, "Level 15");
	settings.Add("level20", false, "Level 20");
	settings.Add("level25", false, "Level 25");
    settings.Add("level30", false, "Level 30");
	settings.Add("level35", false, "Level 35");
    settings.Add("level40", false, "Level 40");
}

start {
    foreach (int targetLevel in vars.levels) {
		if (current.level == targetLevel && old.state != 5 && current.state == 5 && settings["level" + targetLevel]) //Start from selected level
			return true;
	}
}

split {
    if (old.state != 12 && current.state == 12 && settings["allclear"]) //Get "All level clear"
        return true;
    foreach (int targetLevel in vars.levels) {
		if (current.level == targetLevel && ((old.state != 8 && current.state == 8 && settings["level" + targetLevel]) || (old.state != 5 && current.state == 5 && settings["transition"]))) //Complete selected level, +split transition if enabled
			return true;
	}
}

reset {
    return old.state != 2 && current.state == 2; //Title screen
}