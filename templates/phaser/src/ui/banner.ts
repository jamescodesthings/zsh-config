import Phaser from 'phaser';
import { Logger } from '../services/logger';

const padding = 64;
const minimumWidth = 200;
const side = 64;

export class Banner extends Phaser.GameObjects.Container {
  private readonly logger: Logger;
  private label: Phaser.GameObjects.Text;
  private leftBanner: Phaser.GameObjects.Sprite;
  private midBanner: Phaser.GameObjects.Sprite;
  private rightBanner: Phaser.GameObjects.Sprite;

  constructor(scene: Phaser.Scene, x: number, y: number, text: string) {
    super(scene, x, y);
    this.logger = Logger.create('component:banner');

    this.label = scene.add.text(x, y, text, {
      fontSize: '28px',
      color: '#fff2d3',
      fontFamily: 'germania',
      align: 'center',
    });

    scene.add.existing(this.label);

    this.label.setOrigin(0.5, 0.5);
    this.label.setDepth(1);

    const labelWidth = this.label.width + padding * 2;
    const scaleAmount = labelWidth / 64;

    this.midBanner = scene.add.sprite(x, y, 'banner-mid');
    this.midBanner.setOrigin(0.5, 0.5);
    this.midBanner.scaleX = scaleAmount;

    const halfLabelWidth = labelWidth / 2;
    const halfSide = side / 2;
    this.leftBanner = scene.add.sprite(x - halfLabelWidth - halfSide, y, 'banner-left');
    this.rightBanner = scene.add.sprite(x + halfLabelWidth + halfSide, y, 'banner-right');

    const totalWidth = labelWidth + side * 2;
    this.width = totalWidth >= minimumWidth ? totalWidth : minimumWidth;
    this.height = side;

    scene.add.existing(this);
  }

  preUpdate(time, delta) {
    const labelWidth = this.label.width + padding;
    const halfLabelWidth = labelWidth / 2;
    const halfSide = side / 2;

    this.label.x = this.x;
    this.label.y = this.y;

    this.midBanner.x = this.x;
    this.midBanner.y = this.y;

    this.leftBanner.x = this.x - halfLabelWidth - halfSide;
    this.leftBanner.y = this.y;

    this.rightBanner.x = this.x + halfLabelWidth + halfSide;
    this.rightBanner.y = this.y;
  }
}
