import { debounce } from 'lodash';
import NinePatch2 from 'phaser3-rex-plugins/plugins/ninepatch2.js';
import { Logger } from '../services/logger';
import { state } from '../services/state';
import { Banner } from '../ui/banner';
import { Button } from '../ui/button';
import { getGameHeight } from '../utils/get-game-height';
import { getGameWidth } from '../utils/get-game-width';

const sceneConfig: Phaser.Types.Scenes.SettingsConfig = {
  active: false,
  visible: false,
  key: 'menu',
};

/**
 * A menu scene.
 */
export class MenuScene extends Phaser.Scene {
  private readonly logger: Logger;
  private tweensFinished = false;
  private banner: Banner;
  private menuBg: NinePatch2;
  private playButton: Button;
  private resetButton: Button;

  constructor(config: Phaser.Types.Scenes.SettingsConfig) {
    super({
      ...sceneConfig,
      ...config,
    });
    this.logger = Logger.create('scene:menu');
  }

  public create(): void {
    const gameWidth = getGameWidth(this);
    const gameHeight = getGameHeight(this);
    this.menuBg = new NinePatch2(
      this,
      gameWidth * 0.5,
      -gameHeight,
      gameWidth * 0.6,
      gameHeight * 0.6,
      'menu-bg',
      [30, 4, 30],
      [30, 4, 30],
    );
    this.add.existing(this.menuBg);

    this.banner = new Banner(this, gameWidth * 0.5, -gameHeight, '$PROJECT_NAME_PRETTY');

    this.playButton = new Button(this, gameWidth * 0.5, -gameHeight, 'Start Game', 'play', () => {
      this.logger.debug('Start tapped');
      this.scene.start('game');
    });
    this.resetButton = new Button(this, gameWidth * 0.5, -gameHeight, 'Reset', 'reset', () => {
      this.logger.debug('reset tapped');
      state.score = 0;
      void state.save();
    });

    this.tweens.add({
      targets: this.menuBg,
      y: gameHeight * 0.5,
      duration: 666,
      ease: 'bounce.out',
      onComplete: () => (this.tweensFinished = true),
    });

    this.tweens.add({
      targets: this.banner,
      y: gameHeight * 0.2,
      duration: 666,
      ease: 'bounce.out',
    });

    this.tweens.add({
      targets: this.playButton,
      y: gameHeight * 0.45,
      duration: 666,
      ease: 'bounce.out',
    });

    this.tweens.add({
      targets: this.resetButton,
      y: gameHeight * 0.55,
      duration: 666,
      ease: 'bounce.out',
    });

    this.scale.on('resize', this.debouncedResize, this);
    this.events.on('shutdown', () => this.destroy(), this);
  }

  destroy(): void {
    this.logger.debug('destroy()');
    this.scale.off('resize', this.debouncedResize, this);
  }

  private debouncedResize = debounce(() => this.resize(), 100, { maxWait: 1000 });

  private resize() {
    if (!this.tweensFinished) return;

    this.logger.debug('resize');

    const gameWidth = getGameWidth(this);
    const gameHeight = getGameHeight(this);

    this.menuBg.x = gameWidth * 0.5;
    this.menuBg.y = gameHeight * 0.5;
    this.menuBg.resize(gameWidth * 0.6, gameHeight * 0.6);

    this.banner.x = gameWidth * 0.5;
    this.banner.y = gameHeight * 0.2;

    this.playButton.x = gameWidth * 0.5;
    this.playButton.y = gameHeight * 0.45;

    this.resetButton.x = gameWidth * 0.5;
    this.resetButton.y = gameHeight * 0.55;
  }
}
