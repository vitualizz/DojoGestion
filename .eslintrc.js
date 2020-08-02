module.exports = {
  env: {
    browser: true,
    es6: true,
    jquery: true,
    amd: true
  },
  parserOptions: {
    parser: "babel-eslint"
  },
  extends: ["eslint:recommended", "plugin:vue/recommended"],
  rules: {
    // override/add rules settings here, such as:
    // 'vue/no-unused-vars': 'error'
  }
}
