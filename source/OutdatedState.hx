package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK); // hey crusher, this version is a demo btw oooooooooooooo
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Sup bro, looks like you tryna run a \n
			demo version of A Legendary Mod (" + MainMenuState.legendVersion + "),\n 
			please update to " + TitleState.updateVersion + " For AWSOME SHIT because the new update is so cool\n
			\n
			Thank you for playing the mod1!11! -- crusher was here ",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT || controls.BACK) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/ShadowMario/FNF-PsychEngine/releases"); //fuhh we need a link, what is a link that we can put? // uhhhhhhhhhhhhhhh idk how to  post source code tell me how? it just needs to go to the mod link so you can download the newest version ther
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
