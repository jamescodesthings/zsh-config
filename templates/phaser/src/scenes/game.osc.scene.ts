import Phaser from 'phaser';
import { Logger } from '../services/logger';
import { state } from '../services/state';
import { getGameHeight } from '../utils/get-game-height';

const sceneConfig: Phaser.Types.Scenes.SettingsConfig = {
  active: false,
  visible: false,
  key: 'game.osc',
};

/**
 * On Screen controller scene
 */
export class GameOSCScene extends Phaser.Scene {
  private readonly logger: Logger;
  private up: Phaser.GameObjects.Sprite;
  private down: Phaser.GameObjects.Sprite;
  private left: Phaser.GameObjects.Sprite;
  private right: Phaser.GameObjects.Sprite;

  /**
   * @constructor
   */
  constructor(config: Phaser.Types.Scenes.SettingsConfig) {
    super({
      ...sceneConfig,
      ...config,
    });
    this.logger = Logger.create('scene:osc');
  }

  create() {
    this.input.addPointer(3);

    this.createController();
    this.attachEvents();
  }

  private createController() {
    const gameHeight = getGameHeight(this);

    // Sprite sizes are 61x76 and 76x61
    const padding = 30;
    const buttonWidth = 114;
    const centerPadding = 5;
    const controllerCenter = { x: padding + buttonWidth, y: gameHeight - padding - buttonWidth };

    this.up = this.add.sprite(controllerCenter.x, controllerCenter.y - centerPadding * 2, 'osc.up');
    this.up.setOrigin(0.5, 1.0);

    this.down = this.add.sprite(controllerCenter.x, controllerCenter.y, 'osc.down');
    this.down.setOrigin(0.5, 0);

    this.left = this.add.sprite(
      controllerCenter.x - centerPadding,
      controllerCenter.y - centerPadding,
      'osc.left',
    );
    this.left.setOrigin(1, 0.5);

    this.right = this.add.sprite(
      controllerCenter.x + centerPadding,
      controllerCenter.y - centerPadding,
      'osc.right',
    );
    this.right.setOrigin(0, 0.5);
  }

  private attachEvents() {
    this.up.setInteractive();
    this.up.on('pointerover', () => {
      this.focus(this.up);
      state.upPressed = true;
    });
    this.up.on('pointerout', () => {
      this.blur(this.up);
      state.upPressed = false;
    });

    this.left.setInteractive();
    this.left.on('pointerover', () => {
      this.focus(this.left);
      state.leftPressed = true;
    });
    this.left.on('pointerout', () => {
      this.blur(this.left);
      state.leftPressed = false;
    });

    this.right.setInteractive();
    this.right.on('pointerover', () => {
      this.focus(this.right);
      state.rightPressed = true;
    });
    this.right.on('pointerout', () => {
      this.blur(this.right);
      state.rightPressed = false;
    });

    this.down.setInteractive();
    this.down.on('pointerover', () => {
      this.focus(this.down);
      state.downPressed = true;
    });
    this.down.on('pointerout', () => {
      this.blur(this.down);
      state.downPressed = false;
    });
  }

  private focus(button: Phaser.GameObjects.Sprite) {
    button.setTint(0xdddddd);
  }

  private blur(button: Phaser.GameObjects.Sprite) {
    button.setTint(0xffffff);
  }
}
