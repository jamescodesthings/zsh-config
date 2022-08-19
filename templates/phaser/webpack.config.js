const path = require('path');
const webpack = require('webpack');
const CopyPlugin = require('copy-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: {
    app: './src/main.ts',
    vendors: ['phaser'],
  },

  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },

  resolve: {
    extensions: ['.ts', '.tsx', '.js'],
  },

  output: {
    // filename: 'app.bundle.js',
    path: path.resolve(__dirname, 'www'),
  },

  mode: process.env.NODE_ENV == 'production' ? 'production' : 'development',

  devServer: {
    allowedHosts: 'all',
    host: '0.0.0.0',
    port: 8080,
  },

  plugins: [
    new CopyPlugin({
      patterns: [
        {
          from: 'assets/**/*',
        },
      ],
    }),
    new webpack.DefinePlugin({
      'typeof CANVAS_RENDERER': JSON.stringify(true),
      'typeof WEBGL_RENDERER': JSON.stringify(true),
    }),
    new HtmlWebpackPlugin({template: "./src/index.ejs", title: "$PROJECT_NAME_PRETTY"}),
  ],

  optimization: { splitChunks: { chunks: "all" } },

};
