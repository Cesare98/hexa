package;

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
		spritesheet.animation.add("idle",[0,1,2],5,true);
		spritesheet.animation.add("dunno",[0,1,2,3,4,10,11],5,true);
		spritesheet.animation.add("walkRight",[80,81,82,83,84,485,86,87,88,89],5,true);
		spritesheet.animation.add("walk",[8,9,10,11,12,13,14,15,16,17,18],5,true);
		add(spritesheet);

		spritesheet.animation.play("dunno");
		// spritesheet.animation.play("idle");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
