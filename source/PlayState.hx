package;

import Enemy;
import Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.input.mouse.FlxMouse;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var enemies:Map<String, Enemy> = new Map();
	var player:Player;
	
	function makeEnemy(name:String, enemyHealth:Float, enemyType:String) {
		var enemy = new Enemy(320, 240, name, enemyType, enemyHealth);
		add(enemy);
		enemies.set(name, enemy);
		return enemy;
	}

	function makePlayer(name:String, playerHealth:Float, playerType:String)
	{
		var p = new Player(160, 120, name, playerType, playerHealth);
		add(p);
		player = p;
		return p;
	}
	
	override public function create()
	{
		super.create();
		FlxG.mouse.load("assets/images/mouse.png");

		add(new FlxText("Test", 12));

		makePlayer("Player", 150.0, "pawn");

		makeEnemy("monkey1", 100.0, "monkey");
		makeEnemy("monkey2", 100.0, "monkey");
		makeEnemy("pawn1", 100.0, "pawn");
		makeEnemy("wifekiller1", 100.0, "sunderland");
		enemies.get("monkey1").move(50, 0);
		enemies.get("monkey2").move(50, 100);
		enemies.get("wifekiller1").move(100, 100);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		var sunderland = enemies.get("wifekiller1");
		sunderland.move(sunderland.x + 1, sunderland.y);
	}
}
