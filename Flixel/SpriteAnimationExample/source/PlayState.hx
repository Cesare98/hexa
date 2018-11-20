package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;


class PlayState extends FlxState
{

	var spritesheet:FlxSprite;
	var text:FlxText;
	override public function create():Void
	{
		super.create();

		text = new FlxText(0,0,300);
		add(text);

		spritesheet = new FlxSprite();
		spritesheet.loadGraphic(AssetPaths.linkEdit2__png,true,100,125);
		spritesheet.animation.add("walkRight",[37,38,39,40,41,42,43,44,45,46],5,true);
		spritesheet.animation.add("walkLeft",[37,38,39,40,41,42,43,44,45,46],5,true,true);
		add(spritesheet);

		spritesheet.animation.callback = function(s:String,frame:Int,index:Int)
		{
			trace("Animation "+s+" -- frame "+frame+ " index: "+index);
		}

		spritesheet.animation.play("walkRight");
		// spritesheet.animation.play("idle");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if(FlxG.keys.justReleased.SPACE)
			if(spritesheet.animation.name == "walkRight")
				spritesheet.animation.play("walkLeft");
				else
				spritesheet.animation.play("walkRigth");
		if(FlxG.keys.justReleased.UP)
			spritesheet.animation.curAnim.frameRate++;
	
		if(FlxG.keys.justReleased.DOWN)
			spritesheet.animation.curAnim.frameRate--;
	
	text.text= "cur speed: "+ spritesheet.animation.curAnim.frameRate;

	if(FlxG.keys.justReleased.ESCAPE)
	{
		spritesheet.animation.curAnim.curFrame = 0;
		spritesheet.animation.finish();
	}
	}
}
