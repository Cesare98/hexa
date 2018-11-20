package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{

	var sprite:FlxSprite;

	override public function create():Void
	{
		super.create();
		
		sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.Oshawuot__png);
		sprite.x=100;
		sprite.y=0;
		//sprite.makeGraphic(300,300,flixel.util.FlxColor.WHITE);	
		// for(y in 0...300)
		// {
		// 	for(x in 0...300)
		// 	{
		// 		if(x%2==1 && y%2==1)
		// 		sprite.pixels.setPixel(x,y,0x0000ff);
		// 		if(x<5 || y<5 || x>295 || y>295)
		// 		sprite.pixels.setPixel(x,y,0xffffff);
		// 	}
		// }
		add(sprite);

		FlxTween.tween(sprite,{x:FlxG.width-sprite.width,
								y:FlxG.height-sprite.height,
								angle:360.0},5,{type:FlxTween.PINGPONG});

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		// sprite.x += 100 *elapsed;
	}
}
