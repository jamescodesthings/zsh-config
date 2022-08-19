import * as Phaser from 'phaser';
import Scenes from './scenes';
import { Logger } from './services/logger';
import Center = Phaser.Scale.Center;
import ScaleModes = Phaser.Scale.ScaleModes;

declare var DEBUG: boolean;

const gameConfig: Phaser.Types.Core.GameConfig = {
  title: '$PROJECT_NAME_PRETTY',
  parent: 'game',
  type: Phaser.AUTO,

  backgroundColor: '#3498db',

  width: 500,
  height: 340,

  scale: {
    mode: ScaleModes.FIT,
    autoCenter: Center.CENTER_BOTH,
  },

  physics: {
    default: 'arcade',
    arcade: {
      debug: DEBUG,
    },
  },
};

export const game = new Phaser.Game(gameConfig);


window.addEventListener('resize', () => {
  Logger.log('resize event fired');
  game.scale.refresh();
});
