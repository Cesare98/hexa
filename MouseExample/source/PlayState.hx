package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class PlayState extends FlxState
{
	var sprite: FlxSprite;
	var scaleFactor = 0.1;

	override public function create():Void
	{
		super.create();

		sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.Oshawuot__png);
		sprite.x = FlxG.width/2 - sprite.width/2;
		sprite.y = FlxG.height/2 - sprite.height/2;
		add(sprite);

		FlxMouseEventManager.add(sprite,
			function(s:FlxSprite){trace("MouseDown");},
			function(s:FlxSprite){trace("MouseUp");},
			function(s:FlxSprite){trace("MouseOver");},
			onMouseOut
		);
	}

	public function onMouseOut(s:FlxSprite)
	{
		trace("Mouse Out, sprite at: "+s.x+","+s.y+"Mouse at "+FlxG.mouse.getPosition());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
	// if(FlxG.mouse.overlaps(sprite)){
	// 	if(FlxG.mouse.pressed)
	// 	{
	// 		sprite.setPosition(FlxG.mouse.getPosition().x - sprite.width/2,
	// 							FlxG.mouse.getPosition().y - sprite.height/2);	
	// 	}
	// }
	// if(FlxG.mouse.justReleasedRight)
	// {
	// 	sprite.x = FlxG.width/2 - sprite.width/2;
	// 	sprite.y = FlxG.height/2 - sprite.height/2;
	// 	sprite.scale.set(1,1);
	// }
	// if(FlxG.mouse.wheel != 0)
	// {
	// 	sprite.scale.add(FlxG.mouse.wheel*scaleFactor,FlxG.mouse.wheel*scaleFactor);
	// }
	
	}

}
