/**
 * A singleton for shared state
 */
import { debounce } from 'lodash';
import { Logger } from './logger';
import { storage } from './storage';

interface PersistConfig {
  /**
   * the default value to store
   */
  default: any;
}
interface Persist {
  [key: string]: PersistConfig;
}

class StateService {
  private readonly logger: Logger;

  /**
   * Config to persist certain values
   * @private
   */
  private readonly persist: Persist = {
    score: { default: 0 },
  };

  private _score = 0;

  public upPressed = false;
  public leftPressed = false;
  public rightPressed = false;
  public downPressed = false;

  set score(score: number) {
    this._score = score;
    this.triggerSave();
  }

  get score(): number {
    return this._score;
  }

  constructor() {
    this.logger = Logger.create('service:state');
  }

  async load(): Promise<void> {
    try {
      const keys = Object.keys(this.persist);
      const promises = keys.map(async (key) => {
        const config = this.persist[key];
        let value = await storage.get(key);
        if (value === null) {
          value = config.default;
        }

        this[key] = value;
      });

      await Promise.all(promises);
      this.logger.debug('Loaded persisted values from config');
    } catch (error) {
      this.logger.error('Could not load state from storage');
    }
  }

  /**
   * Debounces save
   */
  triggerSave(): void {
    void this.saveDebounced();
  }

  saveDebounced = debounce(() => this.save(), 5000, { maxWait: 10000 });

  /**
   * Saves all persisted keys to storage
   */
  async save(): Promise<void> {
    try {
      this.logger.debug('save()');
      const keys = Object.keys(this.persist);
      const promises = keys.map(async (key) => {
        const config = this.persist[key];
        let value = this[key];

        if (value === null) {
          value = config.default;
        }

        return storage.set(key, value);
      });

      await Promise.all(promises);
      this.logger.debug('Saved state');
    } catch (error) {
      this.logger.error('Could not save state to storage');
    }
  }

  async init() {
    try {
      await state.load();

      // Depending on browser this may be no good, but it's worth a shot so fuck it right?
      window.addEventListener('beforeunload', (event) => {
        void this.save();
      });
    } catch (error) {
      this.logger.error('Could not init state:', error);
      throw error;
    }
  }
}

export const state = new StateService();
