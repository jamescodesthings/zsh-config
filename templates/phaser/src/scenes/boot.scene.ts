import { getGameWidth } from '../utils/get-game-width';
import { getGameHeight } from '../utils/get-game-height';

const sceneConfig: Phaser.Types.Scenes.SettingsConfig = {
  active: false,
  visible: false,
  key: 'boot',
};

/**
 * Boot scene, loads assets
 */
export class BootScene extends Phaser.Scene {
  constructor(config: Phaser.Types.Scenes.SettingsConfig) {
    super({
      ...sceneConfig,
      ...config,
    });
  }

  public preload(): void {
    const halfWidth = getGameWidth(this) * 0.5;
    const halfHeight = getGameHeight(this) * 0.5;

    const progressBarHeight = 100;
    const progressBarWidth = 400;

    const progressBarContainer = this.add.rectangle(
      halfWidth,
      halfHeight,
      progressBarWidth,
      progressBarHeight,
      0x000000,
    );
    const progressBar = this.add.rectangle(
      halfWidth + 20 - progressBarContainer.width * 0.5,
      halfHeight,
      10,
      progressBarHeight - 20,
      0x888888,
    );

    const loadingText = this.add
      .text(halfWidth - 75, halfHeight - 100, 'Loading...')
      .setFontSize(24);
    const percentText = this.add.text(halfWidth - 25, halfHeight, '0%').setFontSize(24);
    const assetText = this.add.text(halfWidth - 25, halfHeight + 100, '').setFontSize(24);

    this.load.on('progress', (value) => {
      progressBar.width = (progressBarWidth - 30) * value;

      const percent = value * 100;
      percentText.setText(`${percent}%`);
    });

    this.load.on('fileprogress', (file: Phaser.Loader.File) => {
      assetText.setText(file.key);
    });

    this.loadAssets();
  }

  create() {
    this.scene.start('menu');
  }

  /**
   * All assets that need to be loaded by the game (sprites, images, animations, tiles, music, etc)
   * should be added to this method. Once loaded in, the loader will keep track of them, indepedent of which scene
   * is currently active, so they can be accessed anywhere.
   */
  private loadAssets() {
    // Load sample assets

    // Source: tutorial source
    this.load.image('man', 'assets/sprites/character.png');

    // Source: Kenney Assets
    this.load.image('menu-bg', 'assets/sprites/tile_0018.64.png');
    this.load.image('button-bg', 'assets/sprites/tile_0017.64.png');
    this.load.image('banner-left', 'assets/sprites/tile_0056.64.png');
    this.load.image('banner-mid', 'assets/sprites/tile_0057.64.png');
    this.load.image('banner-right', 'assets/sprites/tile_0058.64.png');

    this.load.image('osc.up', 'assets/controls/flatDark02@1.5.png');
    this.load.image('osc.left', 'assets/controls/flatDark04@1.5.png');
    this.load.image('osc.right', 'assets/controls/flatDark05@1.5.png');
    this.load.image('osc.down', 'assets/controls/flatDark09@1.5.png');

    this.load.image('fullscreen.enter', 'assets/controls/larger.png');
    this.load.image('fullscreen.exit', 'assets/controls/smaller.png');
  }
}
