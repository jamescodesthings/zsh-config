import Phaser from 'phaser';
import { Logger } from '../services/logger';
import { state } from '../services/state';

const sceneConfig: Phaser.Types.Scenes.SettingsConfig = {
  active: false,
  visible: false,
  key: 'game.hud',
};

/**
 * Hud Scene, displays hud text
 */
export class GameHUDScene extends Phaser.Scene {
  private readonly padding = 50;

  private logger: Logger;
  private scoreLabel: Phaser.GameObjects.Text;

  constructor(config: Phaser.Types.Scenes.SettingsConfig) {
    super({
      ...sceneConfig,
      ...config,
    });
    this.logger = Logger.create('scene:hud');
  }

  create() {
    this.scoreLabel = this.add.text(this.padding, this.padding, GameHUDScene.getScoreLabel(), {
      fontFamily: 'geo',
      fontSize: '28px',
      color: '#fff',
    });
    this.logger.debug('created');
  }

  update() {
    // Get the score from the shared state and update it
    this.scoreLabel.setText(GameHUDScene.getScoreLabel());
  }

  private static getScoreLabel() {
    return `score: ${state.score}`;
  }
}
