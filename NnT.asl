state("NNT", "")
{
	// level data
	int curLevel : "mono.dll", 0x001F10AC, 0x60, 0x194;
	int newLevel : "mono.dll", 0x001F10AC, 0x60, 0x198;
	
	// state data
	byte isSneaking : "mono.dll", 0x001F10AC, 0x60, 0x5C, 0x33B;
	byte currentState : "mono.dll", 0x001F10AC, 0x60, 0x5C, 0x34;
	byte enteringPortal : "mono.dll", 0x001F10AC, 0x60, 0x5C, 0x611;
	byte usingTransport : "mono.dll", 0x001F10AC, 0x60, 0x5C, 0x615;
	float movementLocked : "mono.dll", 0x001F10AC, 0x60, 0x5C, 0x6EC;
	
	// first slot save data
	string4 rescuePercent : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0x8, 0xC;
	string19 timeDateSaved : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0xC, 0xC;
	int rescueStatus : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0x10;
	float timePlayed : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0x14;
	int difficulty : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0x18;
	int chapter : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x8, 0x1C;
	
	// second slot save data
	string4 rescuePercentTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0x8, 0xC;
	string19 timeDateSavedTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0xC, 0xC;
	int rescueStatusTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0x10;
	float timePlayedTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0x14;
	int difficultyTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0x18;
	int chapterTwo : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0xC, 0x1C;
	
	// third slot save data
	string4 rescuePercentThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0x8, 0xC;
	string19 timeDateSavedThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0xC, 0xC;
	int rescueStatusThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0x10;
	float timePlayedThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0x14;
	int difficultyThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0x18;
	int chapterThree : "mono.dll", 0x001F10AC, 0x3D4, 0x13C, 0x10, 0x1C;
}

startup
{
	vars.IsLoading = true;
	vars.difficultyOne = "Loading";
	vars.difficultyTwo = "Loading";
	vars.difficultyThree = "Loading";
}

start
{
	if (current.newLevel == 0 && old.newLevel == 84)
	{
		return true;
	}
	else
	{
		return false;
	}
}

update
{
	if (current.curLevel != current.newLevel)
	{
		vars.IsLoading = true;
	}
	else
	{
		vars.IsLoading = false;
	}
	
	vars.difficultyOne = current.difficulty + " For Slot 1";
	vars.difficultyTwo = current.difficultyTwo + " For Slot 2";
	vars.difficultyThree = current.difficultyThree + " For Slot 3";
}

isLoading
{
	if (current.curLevel != current.newLevel)
	{
		return true;
	}
	else
	{
		return false;
	}
}

reset
{
	if (current.newLevel == 84 && old.newLevel == 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}