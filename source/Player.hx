package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    public var health:Float;
    public var playerName:String;
    public var type:String;

    public function new(x:Float = 320, y:Float = 240, name:String = "Player", type:String = "default", health:Float = 100)
    {
        super(x, y);
        playerName = name;
        this.health = health;
        this.type = type;

        switch type {
            case "pawn": loadGraphic("assets/images/pawn.png", true, 32, 64);
            default: loadGraphic("assets/images/missingenemy.png", true, 32, 64);
        }
    }

    public function killPlayer():Void
    {
        trace("killing " + playerName);
        kill();
    }

    public function damage(amount:Float):Void
    {
        health -= amount;
        trace(playerName + " taking " + amount + " damage");
        if (health <= 0) {
            killPlayer();
        }
    }

    public function move(moveX:Float, moveY:Float):Void
    {
        this.x = moveX;
        this.y = moveY;
    }

    public function updateMovement():Void
    {
        velocity.set(0, 0);
        if (FlxG.keys.pressed.A) velocity.x = -100;
        if (FlxG.keys.pressed.D) velocity.x = 100;
        if (FlxG.keys.pressed.W) velocity.y = -100;
        if (FlxG.keys.pressed.S) velocity.y = 100;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        updateMovement();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}
