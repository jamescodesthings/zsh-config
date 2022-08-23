import Debug, { debug } from 'debug';
import { isDebug } from '../utils/is-debug';

interface Loggers {
  [key: string]: Logger;
}

interface LogLevelLogger {
  [key: string]: debug.Debugger;
}

/**
 * Available log levels
 * @todo: could make the constructor generate methods for these & typedef
 */
export enum LogLevel {
  TRACE = 'trace',
  DEBUG = 'debug',
  INFO = 'info',
  WARN = 'warn',
  ERROR = 'error',
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

  static create(tag = 'global'): Logger {
    this.initLoggers();

    if (!this.loggers[tag]) {
      this.loggers[tag] = new Logger(tag);
    }

    return this.loggers[tag];
  }

  private static initLoggers() {
    if (!this.loggers) {
      this.loggers = {
        global: new Logger('global'),
      };
    }
  }

  static log(formatter: any, ...args: any[]) {
    this.initLoggers();
    this.loggers['global'].debug(formatter, ...args);
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

  private readonly logger: LogLevelLogger;

  private constructor(tag: string = null) {
    this.logger = {};

    Object.values(LogLevel).forEach((level) => {
      const levelTag = `${tag}:${level}`;
      this.logger[level] = Debug(levelTag);
      if (isDebug()) this.logger[level].enabled = true;
    });
  }

  trace(formatter: any, ...args: any[]) {
    this.logger[LogLevel.TRACE](formatter, ...args);
  }

  debug(formatter: any, ...args: any[]) {
    this.logger[LogLevel.DEBUG](formatter, ...args);
  }

  info(formatter: any, ...args: any[]) {
    this.logger[LogLevel.INFO](formatter, ...args);
  }

  warn(formatter: any, ...args: any[]) {
    this.logger[LogLevel.WARN](formatter, ...args);
  }

  error(formatter: any, ...args: any[]) {
    this.logger[LogLevel.ERROR](formatter, ...args);
  }
}
