package;

#if desktop
import Discord.DiscordClient;
#end
// idk
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end

var blackScreen:FlxSprite;
var secretStuff:Int = 0;
var secArr=[]; //shall I make an outdated warning???

secArr=[FlxG.keys.pressed.FOUR,FlxG.keys.pressed.ONE,FlxG.keys.pressed.NINE,FlxG.keys.pressed.SIX]; // this might make it work but idk
if(secretStuff<secArr.length) {
    if(secArr[secretStuff+1]==true) {
        secretStuff+=1;
        FlxG.sound.play(Paths.sound('scrollMenu'));
    }
} else if(secretStuff>=secArr.length) {
    if (stopspamming == true)
        {
            FlxG.sound.play(Paths.sound('confirmMenu'));

            grpWeekText.members[curWeek].startFlashing();
            if(grpWeekCharacters.members[1].character != '') 
                                grpWeekCharacters.members[1].animation.play('confirm');
            stopspamming = true;
        }

        // We can't use Dynamic Array .copy() because that crashes HTML5, here's a workaround
        var songArray:Array<String> = [];
        var leWeek:Array<Dynamic> = WeekData.weeksLoaded.get(WeekData.weeksList[curWeek]).songs;
        for (i in 0...leWeek.length) {
            songArray.push(leWeek[i][0]);
        }
        
        // Force Difficulty to be unfair
        curDifficulty=3;
        // Nevermind that's stupid lmao
        //PlayState.storyPlaylist = songArray; 
        PlayState.isStoryMode = true;
        PlayState.storyPlaylist = ['test'];
        selectedWeek = true;

        var diffic = CoolUtil.difficultyStuff[curDifficulty][1];
        if(diffic == null) diffic = '';

        PlayState.storyDifficulty = 3;

        PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, 
                        PlayState.storyPlaylist[0].toLowerCase());
        PlayState.storyWeek = curWeek;
        PlayState.campaignScore = 0;
        PlayState.campaignMisses = 0;
        new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            LoadingState.loadAndSwitchState(new PlayState(), true);
            FreeplayState.destroyFreeplayVocals();
        });
    //FlxG.sound.play(Paths.sound('cancelMenu'));
}

FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
new FlxRect(-300, -300, FlxG.width * 1.8, FlxG.height * 1.8));
FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
{asset: diamond, width: 32, height: 32}, new FlxRect(-300, -300, FlxG.width * 1.8, FlxG.height * 1.8));
