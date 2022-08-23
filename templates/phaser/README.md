# $PROJECT_NAME_PRETTY

$PROJECT_NAME_PRETTY: A Phaser Game.

Based on tutorials from `plainenglish.io`: [A Step-by-Step Tutorial On Making A Phaser 3 Game](https://javascript.plainenglish.io/phaser-js-a-step-by-step-tutorial-on-making-a-phaser-3-game-dbee8ef9eadb)

## Setup

Create with the `new` cli using something like:

```shell
new --lang phaser --name boilerplate-game --out 00-boilerplate
```

Run the following to configure the project:

```shell
npm i
npm run cap:init
```

## Running

To run on `web`:

```shell
npm start
```

To run on `ios`:

```shell
npm run cap:build:ios
npm run cap:open:ios
# Run the ios project

# With Livereload
# uncomment the livereload config in capacitor.config.ts
npm run cap:build:ios
npm run cap:open:ios
npm start
# Run the ios project
```

To run on `android`:

```shell
npm run cap:build:android
npm run cap:open:android
# Run the android project

# With Livereload
# uncomment the livereload config in capacitor.config.ts
npm run cap:build:android
npm run cap:open:android
npm start
# Run the android project
```
