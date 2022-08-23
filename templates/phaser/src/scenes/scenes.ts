import Phaser from 'phaser';
import { BootScene } from './boot.scene';
import { GameFullscreenScene } from './game.fullscreen.scene';
import { GameHUDScene } from './game.hud.scene';
import { GameOSCScene } from './game.osc.scene';
import { GameScene } from './game.scene';
import { MenuScene } from './menu.scene';

interface Scenes {
  [key: string]: typeof Phaser.Scene;
}

export const scenes: Scenes = {
  boot: BootScene,
  menu: MenuScene,
  game: GameScene,
  'game.hud': GameHUDScene,
  'game.osc': GameOSCScene,
  'game.fullscreen': GameFullscreenScene,
};

export const defaultScene = 'boot';
