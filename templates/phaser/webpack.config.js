/* eslint-disable no-undef */
const path = require('path');
const webpack = require('webpack');
const CopyPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const HtmlWebpackInjectPreload = require('@principalstudio/html-webpack-inject-preload');

const mode = process.env.NODE_ENV === 'production' ? 'production' : 'development';

const cssLoader = {
  test: /\.(s(a|c)ss)$/,
  use: ['style-loader', 'css-loader', 'sass-loader'],
};

if (mode === 'production') {
  cssLoader.use = [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'];
}

let config = {
  mode,

  target: 'web',

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
      cssLoader,
      {
        test: /\.(woff|woff2|eot|ttf|svg)$/,
        type: 'asset/resource',
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

  devServer: {
    allowedHosts: 'all',
    host: '0.0.0.0',
    port: 8080,
    hot: false,
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
      DEBUG: mode === 'development',
    }),
    new HtmlWebpackPlugin({ template: './src/index.ejs', title: 'Phaser Game' }),
    new HtmlWebpackInjectPreload({
      files: [
        {
          match: /\.(woff|woff2|eot|ttf|svg)$/,
          attributes: { as: 'font', crossorigin: true },
        },
      ],
    }),
  ],

  optimization: { splitChunks: { chunks: 'all' } },
};

if (mode === 'production') {
  config.plugins.push(new MiniCssExtractPlugin());
}

module.exports = config;
