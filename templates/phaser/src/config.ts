import Phaser from 'phaser';
import { Logger } from './services/logger';
import { isDebug } from './utils/is-debug';
import scenes from './scenes';
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

  scene: scenes,

  width: 854,
  height: 480,

  scale: {
    mode: Phaser.Scale.ScaleModes.NONE,
    width: window.innerWidth,
    height: window.innerHeight,
  },

  autoFocus: true,

  canvasStyle: `display: block; width: 100%; height: 100%;`,

  render: {
    antialiasGL: false,
    pixelArt: true,
  },

  audio: {
    disableWebAudio: false,
  },

  callbacks: {
    postBoot: () => {
      const logger = Logger.create('game:config');
      logger.debug('postBoot()');
      window.sizeChanged();
    },
  },

  physics: {
    default: 'arcade',
    arcade: {
      debug: isDebug() && false,
    },
  },
};
