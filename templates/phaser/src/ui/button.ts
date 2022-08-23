import * as Phaser from 'phaser';
import NinePatch2 from 'phaser3-rex-plugins/plugins/ninepatch2';
import { Logger } from '../services/logger';

const paddingX = 40;
const paddingY = 10;
const minimumWidth = 200;
const minimumHeight = 40;

export class Button extends Phaser.GameObjects.Container {
  private readonly logger: Logger;

  private label: Phaser.GameObjects.Text;
  private buttonBg: NinePatch2;

  constructor(
    scene: Phaser.Scene,
    x: number,
    y: number,
    text: string,
    id?: string,
    onClick?: () => void,
  ) {
    super(scene, x, y);

    let tag = 'component:button';
    if (id) {
      tag = `component:button:${id}`;
    }
    this.logger = Logger.create(tag);

    this.label = scene.add.text(x + paddingX, y + paddingY, text, {
      fontFamily: 'roboto',
      fontSize: '18px',
      color: '#fff2d3',
      align: 'center',
    });
    this.label.setOrigin(0.5, 0.5);
    this.label.setDepth(1);

    const labelWidth = this.label.width + paddingX * 2;
    const labelHeight = this.label.height + paddingY * 2;

    this.buttonBg = new NinePatch2(
      scene,
      x - labelWidth / 2,
      0,
      labelWidth,
      labelHeight,
      'button-bg',
      [30, 4, 30],
      [30, 4, 30],
    );
    scene.add.existing(this.buttonBg);

    this.width = labelWidth >= minimumWidth ? labelWidth : minimumWidth;
    this.height = 64;

    this.setInteractive({ useHandCursor: true });
    this.on('pointerover', () => this.enterMenuButtonHoverState());
    this.on('pointerout', () => this.enterMenuButtonRestState());
    this.on('pointerdown', () => this.enterMenuButtonActiveState());
    this.on('pointerup', () => this.enterMenuButtonHoverState());

    if (onClick && typeof onClick === 'function') {
      this.on('pointerup', () => {
        this.logger.debug('clicked');
        onClick();
      });
    }

    this.enterMenuButtonRestState();
    scene.add.existing(this);
  }

  preUpdate() {
    this.label.x = this.x;
    this.label.y = this.y;
    this.buttonBg.x = this.x;
    this.buttonBg.y = this.y;
  }

  private enterMenuButtonHoverState() {
    this.label.setTint(0xeeeeee);
    this.buttonBg.setTint(0xeeeeee);
  }

  private enterMenuButtonRestState() {
    this.label.setTint(0xffffff);
    this.buttonBg.setTint(0xffffff);
  }

  private enterMenuButtonActiveState() {
    this.label.setTint(0xdddddd);
    this.buttonBg.setTint(0xdddddd);
  }
}
