import './styles/app.scss';
import { Game } from './game';

void (async () => {
  try {
    const game = new Game();
    await game.run();
  } catch (e) {
    console.error(e);
  }
})();
