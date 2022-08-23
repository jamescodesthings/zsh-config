import { Logger } from '../services/logger';
import { state } from '../services/state';
import { getGameWidth } from '../utils/get-game-width';
import { getGameHeight } from '../utils/get-game-height';
import { isMobile } from '../utils/is-mobile';
import { isNative } from '../utils/is-native';

/**
 * The main game scene
 */
export class GameScene extends Phaser.Scene {
  private readonly logger: Logger;

  public speed = 200;

  private cursorKeys: Phaser.Types.Input.Keyboard.CursorKeys;
  private image: Phaser.Physics.Arcade.Sprite;

  constructor(config: string | Phaser.Types.Scenes.SettingsConfig) {
    super(config);
    this.logger = Logger.create('scene:game');
  }

  public create(): void {
    // Add HUD Scene
    this.scene.launch('game.hud');
    // Add onscreen controls
    if (isMobile(this)) {
      this.logger.debug('is mobile, adding on screen controls');
      this.scene.launch('game.osc');
    }
    if (!isNative()) {
      // Add Fullscreen overlay
      this.scene.launch('game.fullscreen');
    }

    // Add a player sprite that can be moved around. Place him in the middle of the screen.
    this.image = this.physics.add.sprite(getGameWidth(this) / 2, getGameHeight(this) / 2, 'man');

    // This is a nice helper Phaser provides to create listeners for some of the most common keys.
    this.cursorKeys = this.input.keyboard.createCursorKeys();

    this.time.addEvent({
      delay: 1000,
      repeat: -1,
      loop: true,
      callback: () => {
        state.score += 10;
      },
    });
  }

  public update(): void {
    // Every frame, we create a new velocity for the sprite based on what keys the player is holding down.
    const velocity = new Phaser.Math.Vector2(0, 0);

    if (this.cursorKeys.left.isDown || state.leftPressed) {
      velocity.x -= 1;
    }
    if (this.cursorKeys.right.isDown || state.rightPressed) {
      velocity.x += 1;
    }
    if (this.cursorKeys.up.isDown || state.upPressed) {
      velocity.y -= 1;
    }
    if (this.cursorKeys.down.isDown || state.downPressed) {
      velocity.y += 1;
    }

    // We normalize the velocity so that the player is always moving at the same speed, regardless of direction.
    const normalizedVelocity = velocity.normalize();
    this.image.setVelocity(normalizedVelocity.x * this.speed, normalizedVelocity.y * this.speed);
  }
}
