const webpack = require("webpack");
const path = require("path");

let babelRules = [{
  test: /\.js?$/,
  use: {
    loader: "babel-loader",
    options: {
      exclude: [
        /node_modules/
      ],
      presets: [
        [
          "@babel/preset-env",
          {
            corejs: 3,
            useBuiltIns: "usage",
            targets: {
                browsers: 'last 2 chrome versions'
            }
          }
        ]
      ],
    }
  }
}];

module.exports = {
  mode: 'development',
  entry: "./lib/src/react_virtualized/index.js",
  output: {
    path: path.resolve(__dirname, "lib/"),
    filename: "over_react_virtualized.js"
  },
  module: {
    rules: babelRules
  },
  externals: [{
    window: "typeof window === 'undefined' ? global : window",
    react: "(typeof window === 'undefined' ? global : window).React",
    'react-dom': "(typeof window === 'undefined' ? global : window).ReactDOM",
  }],
};
