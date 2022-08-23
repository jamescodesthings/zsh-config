import NinePatch2 from 'phaser3-rex-plugins/plugins/ninepatch2.js';
import { Logger } from '../services/logger';
import { state } from '../services/state';
import { Banner } from '../ui/banner';
import { Button } from '../ui/button';
import { getGameHeight } from '../utils/get-game-height';
import { getGameWidth } from '../utils/get-game-width';

/**
 * A menu scene.
 */
export class MenuScene extends Phaser.Scene {
  private readonly logger: Logger;
  constructor(config: string | Phaser.Types.Scenes.SettingsConfig) {
    super(config);
    this.logger = Logger.create('scene:menu');
  }

  public create(): void {
    const gameWidth = getGameWidth(this);
    const gameHeight = getGameHeight(this);
    const menuBg = new NinePatch2(
      this,
      gameWidth * 0.5,
      -gameHeight,
      gameWidth * 0.6,
      gameHeight * 0.6,
      'menu-bg',
      [30, 4, 30],
      [30, 4, 30],
    );
    this.add.existing(menuBg);

    const banner = new Banner(this, getGameWidth(this) * 0.5, -gameHeight, '$PROJECT_NAME_PRETTY');

    const playButton = new Button(this, gameWidth * 0.5, -gameHeight, 'Start Game', 'play', () => {
      this.logger.debug('Start tapped');
      this.scene.start('game');
    });
    const resetButton = new Button(this, gameWidth * 0.5, -gameHeight, 'Reset', 'reset', () => {
      this.logger.debug('reset tapped');
      state.score = 0;
      void state.save();
    });

    this.tweens.add({
      targets: menuBg,
      y: gameHeight * 0.5,
      duration: 666,
      ease: 'bounce.out',
    });

    this.tweens.add({
      targets: banner,
      y: getGameHeight(this) * 0.2,
      duration: 666,
      ease: 'bounce.out',
    });

    this.tweens.add({
      targets: playButton,
      y: getGameHeight(this) * 0.45,
      duration: 666,
      ease: 'bounce.out',
    });

    this.tweens.add({
      targets: resetButton,
      y: getGameHeight(this) * 0.55,
      duration: 666,
      ease: 'bounce.out',
    });
  }
}
