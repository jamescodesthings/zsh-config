import { debounce } from 'lodash';
import * as Phaser from 'phaser';
import { config } from './config';
import { Logger } from './services/logger';
import { state } from './services/state';

declare global {
  interface Window {
    sizeChanged: () => void;
  }
}

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
      this.addResizeListener();
      await state.init();
      this.game = new Phaser.Game(config);
    } catch (error) {
      this.logger.error('Error running the game:', error);
    }
  }

  private addResizeListener() {
    window.sizeChanged = debounce(() => this.onResize(), 100, { maxWait: 1000 });

    window.addEventListener('resize', () => window.sizeChanged());
  }

  private onResize() {
    if (!this.game) return;

    this.logger.debug('resize fired');
    this.game.scale.resize(window.innerWidth, window.innerHeight);
    this.game.canvas.setAttribute(
      'style',
      `display: block; width: ${window.innerWidth}px; height: ${window.innerHeight}px;`,
    );
  }
}
