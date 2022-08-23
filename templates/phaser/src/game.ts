import { debounce } from 'lodash';
import * as Phaser from 'phaser';
import { config } from './config';
import { defaultScene, scenes } from './scenes/scenes';
import { Logger } from './services/logger';
import { state } from './services/state';

/**
 * A game wrapper class
 */
export class Game {
  private game: Phaser.Game;
  private logger: Logger;

  /**
   * @constructor
   */
  constructor() {
    this.logger = Logger.create('game');
  }

  /**
   * Runs the game
   */
  async run() {
    try {
      this.logger.debug('game.run();');
      this.game = new Phaser.Game(config);
      await state.init();
      this.addScenes();
      this.startDefaultScene();
      this.addResizeListener();
    } catch (error) {
      this.logger.error('Error running the game:', error);
    }
  }

  private addScenes() {
    Object.keys(scenes).forEach((key) => {
      const scene = scenes[key];
      this.logger.debug('Adding scene %s', key);
      this.game.scene.add(key, scene);
    });
  }

  private startDefaultScene() {
    this.logger.info('Starting scene %s', defaultScene);
    this.game.scene.start(defaultScene);
  }

  private addResizeListener() {
    window.addEventListener(
      'resize',
      debounce(() => this.onResize(), 100, { maxWait: 1000 }),
    );
  }

  private onResize() {
    this.logger.debug('resize fired');
    this.game.scale.refresh();
  }
}
