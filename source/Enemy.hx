package;

import flixel.FlxSprite;

class Enemy extends FlxSprite
{
    public var health:Float;
    public var enemyName:String;
    public var type:String;

    public function new(x:Float = 320, y:Float = 240, name:String = "Enemy", type:String = "default", health:Float = 100)
    {
        super(x, y);
        enemyName = name;
        this.health = health;
        this.type = type;

        switch type {
            // development enemies
            case "cuboid": loadGraphic("assets/images/enemy.png", true, 32, 64);
            case "alien": loadGraphic("assets/images/alien.png", true, 32, 64);
            case "monkey": loadGraphic("assets/images/monkey.png", true, 32, 64);
            case "pawn": loadGraphic("assets/images/pawn.png", true, 32, 64);
            default: loadGraphic("assets/images/missingenemy.png", true, 32, 64);
        }
    }


    public function killEnemy():Void
    {
        trace("killing " + enemyName);
        kill();
    }

    public function damage(amount:Float):Void
    {
        health -= amount;
        trace(enemyName + " taking " + amount + " damage");
        if (health <= 0) {
            killEnemy();
        }
    }

    public function move(moveX:Float, moveY:Float)
    {
        this.x = moveX;
        this.y = moveY;
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}
