package;

import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite(AssetPaths.Oshawuot__png);
		sprite.x = FlxG.width/2 - sprite.width/2;
		sprite.y = FlxG.height/2 - sprite.height/2;

		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if(FlxG.keys.pressed.LEFT)
			sprite.x--;
		if(FlxG.keys.pressed.RIGHT)
		sprite.x++;	
		if(FlxG.keys.justReleased.UP)
		sprite.y++;	
		if(FlxG.keys.justReleased.DOWN)
		sprite.y--;
		if(FlxG.keys.anyJustPressed([FlxKey.ESCAPE,FlxKey.SPACE]))
		{
			sprite.x = FlxG.width/2 - sprite.width/2;
			sprite.y = FlxG.height/2 - sprite.height/2;

		}
	}
}
