import Phaser from 'phaser';
import { Logger } from '../services/logger';
import { getGameWidth } from '../utils/get-game-width';

const sceneConfig: Phaser.Types.Scenes.SettingsConfig = {
  active: false,
  visible: false,
  key: 'game.fullscreen',
};

export class GameFullscreenScene extends Phaser.Scene {
  private readonly logger: Logger;
  private button: Phaser.GameObjects.Sprite;

  constructor(config: Phaser.Types.Scenes.SettingsConfig) {
    super({
      ...sceneConfig,
      ...config,
    });
    this.logger = Logger.create('scene:fullscreen');
  }

  create() {
    const padding = 10;
    const gameWidth = getGameWidth(this);

    this.button = this.add.sprite(gameWidth - padding, padding, 'fullscreen.enter');
    this.button.setOrigin(1, 0);

    this.button.setInteractive();
    this.button.on('pointerdown', () => {
      this.button.setTint(0xdddddd);
      this.toggleFullscreen();
    });
    this.button.on('pointerup', () => {
      this.button.setTint(0xffffff);
    });

    this.scale.on('fullscreenchange', (event) => {
      this.logger.debug('fullscreenchange: %s', event);
    });

    document.addEventListener('fullscreenchange', (event) => {
      const isFullscreen = this.scale.isFullscreen;
      this.logger.debug('fullscreen:', isFullscreen);
      if (isFullscreen) {
        this.button.setTexture('fullscreen.exit');
      } else {
        this.button.setTexture('fullscreen.enter');
      }
    });
  }

  private toggleFullscreen() {
    if (this.scale.isFullscreen) {
      this.scale.stopFullscreen();
    } else {
      this.scale.startFullscreen();
    }
  }
}
