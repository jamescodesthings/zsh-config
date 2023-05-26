module.exports = {
  env: {
    node: true,
    es2021: true,
    mocha: true,
  },
  extends: ["eslint:recommended", "plugin:prettier/recommended"],
  overrides: [],
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },
  rules: {},
};
