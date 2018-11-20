package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxObject;

class PlayState extends FlxState
{

	var soundEffect:FlxSound;
	var soundX: Float;
	var soundY:Float;
	var ear:FlxObject; 

	override public function create():Void
	{
		super.create();

		#if flash
		FlxG.sound.playMusic(AssetPaths.joker__ogg);
		soundEffect = FlxG.sound.load(AssetPaths.creepydoor__ogg);
		#else
		FlxG.sound.playMusic(AssetPaths.joker__ogg);
		soundEffect = FlxG.sound.load(AssetPaths.creepydoor__ogg);
		#end

		FlxG.sound.music.onComplete = function(){
			trace("Song Ended");
		}
			soundX = FlxG.width/2;
			soundY = FlxG.height/2;
			ear= new FlxObject();
			ear.setPosition(soundX,soundY);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if(FlxG.keys.justPressed.G)
			soundEffect.play(true);
		if(FlxG.keys.justPressed.LEFT)
			soundX -= 25;
		if(FlxG.keys.justPressed.RIGHT)
			soundX += 25;
		if(FlxG.keys.justPressed.UP)
			soundY -= 25;
		if(FlxG.keys.justPressed.DOWN)
			soundY += 25;
		FlxG.sound.music.proximity(soundX,soundY,ear,300,true);
	}
}
