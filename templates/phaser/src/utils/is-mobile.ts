import Phaser from 'phaser';

export function isMobile(scene: Phaser.Scene) {
  return !scene.sys.game.device.os.desktop;
}
