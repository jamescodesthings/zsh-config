import * as Debug from 'debug';

declare var DEBUG: boolean;

interface Loggers {
  [key: string]: Logger;
}

interface LogLevelLogger {
  [key: string]: Debug;
}

export enum LogLevel {
  TRACE = 'trace',
  DEBUG = 'debug',
  INFO = 'info',
  warn = 'warn',
  error = 'error',
}

/**
 * A basic logger class (singleton)
 *
 * Usage:
 * ```
 * const logger = Logger.create(tag);
 * logger.debug('Some Debug Message');
 * Logger.log('Some global log message')
 * ```
 */
export class Logger {
  // Logger Manager
  static loggers: Loggers;

  static create(tag: string = 'global'): Logger {
    if (!this.loggers) {
      this.loggers = {
        global: new Logger('global'),
      };
    }

    if (!this.loggers[tag]) {
      this.loggers[tag] = new Logger(tag);
    }

    return this.loggers[tag];
  }

  static log(...args) {
    this.loggers['global'].debug(...args);
  }

  static list() {
    const keys = Object.keys(this.loggers);

    keys.forEach((key) => {
      const levels = Object.keys(this.loggers[key].logger);

      levels.forEach((level) => {
        this.log(`${key}:${level}`);
      });
    });
  }

  // Single Logger Interface:
  private readonly logger: LogLevelLogger;

  private constructor(tag: string = null) {
    this.logger = {};

    Object.values(LogLevel).forEach((level) => {
      const levelTag = `${tag}:${level}`;
      this.logger[level] = Debug(levelTag);
      if (DEBUG) this.logger[level].enabled = true;
    });
  }

  trace(...args) {
    this.logger[LogLevel.TRACE](...args);
  }

  debug(...args) {
    this.logger[LogLevel.DEBUG](...args);
  }

  info(...args) {
    this.logger[LogLevel.INFO](...args);
  }

  warn(...args) {
    this.logger[LogLevel.warn](...args);
  }

  error(...args) {
    this.logger[LogLevel.error](...args);
  }
}
