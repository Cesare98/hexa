package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flash.filters.BlurFilter;

class PlayState extends FlxState
{

	var background:FlxSprite;
	var placeholder:FlxSprite;
	var myCamera:FlxCamera;
	var blur:Bool;
	override public function create():Void
	{
		super.create();
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.sunset__png);

		placeholder = new FlxSprite();
		placeholder.loadGraphic(AssetPaths.Oshawuot__png);
		placeholder.x = 320 - placeholder.width/2;

		myCamera = new FlxCamera(0,0,640,480);
		FlxG.cameras.reset(myCamera);
		myCamera.target = placeholder;
		myCamera.setScrollBoundsRect(0,0,background.width,background.height);

		var myCamera2: FlxCamera(320,0,320,480);
		FlxG.cameras.add(myCamera2);

		add(background);
		add(placeholder);
		blur = false;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if(FlxG.keys.justReleased.UP)
		camera.zoom += 0.1;
		if(FlxG.keys.justReleased.DOWN)
			if(camera.zoom > 1)
			camera.zoom -= 0.1;
		if(FlxG.keys.justReleased.S)
		camera.shake(0.001,1);
		if(FlxG.keys.justReleased.A)
		camera.flash(flixel.util.FlxColor.RED,0.5);
		if(FlxG.keys.justReleased.ESCAPE)
		blur = !blur;
		if(blur)
		{
			var filter = new BlurFilter();
			camera.setFilters([filter]);
		}
		else
		{
			camera.setFilters([]);
		}
		placeholder.x+= 300 * elapsed;
		if (placeholder.x > background.width)
		{
			camera.fade(flixel.util.FlxColor.BLACK,2.0,false,function(){
				FlxG.resetGame();
			});
		}
	}
}
