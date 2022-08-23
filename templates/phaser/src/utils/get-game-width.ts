import Phaser from 'phaser';

/**
 * Gets the width of the game in pixels, given a scene
 * @param scene The scene this is called from
 * @return the width of the game in px
 * @example
 * ```
 * const width = getGameWidth(this);
 * ```
 */
export function getGameWidth(scene: Phaser.Scene): number {
  return scene.game.scale.width;
}
