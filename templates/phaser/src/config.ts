import Phaser from 'phaser';
import { isDebug } from './utils/is-debug';
import Center = Phaser.Scale.Center;
import ScaleModes = Phaser.Scale.ScaleModes;
import GameConfig = Phaser.Types.Core.GameConfig;

/**
 * Our game config
 */
export const config: GameConfig = {
  title: '$PROJECT_NAME_PRETTY',
  parent: 'game',
  type: Phaser.AUTO,

  // disables aliasing
  pixelArt: true,

  backgroundColor: '#3498db',

  width: 854,
  height: 480,

  scale: {
    mode: ScaleModes.FIT,
    autoCenter: Center.CENTER_BOTH,
  },

  physics: {
    default: 'arcade',
    arcade: {
      debug: isDebug() && false,
    },
  },
};
