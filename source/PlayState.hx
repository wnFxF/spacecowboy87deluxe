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

		add(new FlxText("LASER SPACE COWBOY '87 DELUXE", 12));

		makePlayer("Player", 150.0, "pawn");

		makeEnemy("Jerry", 100.0, "monkey");
		makeEnemy("John", 100.0, "monkey");
		makeEnemy("Pawn1", 100.0, "pawn");
		
		enemies.get("Jerry").move(50,0);
		enemies.get("John").move(50,100);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
