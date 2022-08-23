import Phaser from 'phaser';

/**
 * Gets the height of the game in pixels, given a scene
 * @param scene The scene this is called from
 * @return the height of the game in px
 * @example
 * ```
 * const width = getGameHeight(this);
 * ```
 */
export function getGameHeight(scene: Phaser.Scene): number {
  return scene.game.scale.height;
}
