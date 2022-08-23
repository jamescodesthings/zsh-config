import { Storage, Drivers } from '@ionic/storage';
import { isNative } from '../utils/is-native';
import { Logger } from './logger';
import * as CordovaSQLiteDriver from 'localforage-cordovasqlitedriver';

class StorageService {
  private readonly logger: Logger;
  private initialized = false;
  private store: Storage;

  constructor() {
    this.logger = Logger.create('service:storage');
  }

  async init() {
    if (this.initialized) return;
    try {
      this.logger.debug('init()');
      let config = {};
      if (isNative()) {
        this.logger.debug('Is native build, adding cordova sqlite storage backend');
        config = {
          driverOrder: [CordovaSQLiteDriver._driver, Drivers.IndexedDB, Drivers.LocalStorage],
        };
      }
      this.store = new Storage(config);

      if (isNative()) {
        this.logger.debug('Defining CordovaSQLiteDriver');
        await this.store.defineDriver(CordovaSQLiteDriver);
      }

      await this.store.create();
      const driver = this.store.driver;

      this.initialized = true;
      this.logger.debug('initialized using driver: %s', driver);
    } catch (e) {
      this.logger.error('could not init storage');
      throw e;
    }
  }

  /**
   * Gets from storage
   * @param key The storage item key
   * @returns A promise that resolves with the value, or null if there's an error
   */
  async get(key: string): Promise<any> {
    try {
      await this.init();
      return await this.store.get(key);
    } catch (error) {
      this.logger.error('Error getting %s: %s', key, error);
      return null;
    }
  }

  /**
   * Sets in storage
   * @param key The storage item key
   * @param value The value
   */
  async set(key: string, value: any): Promise<void> {
    try {
      await this.init();
      await this.store.set(key, value);
    } catch (error) {
      this.logger.error('Error setting %s: %s: %s', key, value, error);
      return null;
    }
  }

  async remove(key: string) {
    try {
      await this.init();
      await this.store.remove(key);
    } catch (error) {
      this.logger.error('Error removing %s: %s', key, error);
      return null;
    }
  }

  async clear() {
    try {
      await this.init();
      await this.store.clear();
    } catch (error) {
      this.logger.error('Error clearing storage: %s', error);
      return null;
    }
  }

  async keys(): Promise<string[]> {
    try {
      await this.init();
      return await this.store.keys();
    } catch (error) {
      this.logger.error('Error getting keys: %s', error);
      return null;
    }
  }

  async length(): Promise<number> {
    try {
      await this.init();
      return await this.store.length();
    } catch (error) {
      this.logger.error('Error getting length: %s', error);
      return null;
    }
  }
}

export const storage = new StorageService();
