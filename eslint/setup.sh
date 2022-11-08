#!/bin/bash

# setup eslint
npm install --save-dev eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-prettier eslint-plugin-unused-imports # eslint-plugin-jest
npm install --save-dev --save-exact prettier
# edit .eslintrc.json and .prettierrc

# setup lint-staged
npm install --save-dev lint-staged
# edit .lintstagedrc

# setup husky
npm install --save-dev husky
npm pkg set scripts.prepare="husky install"
npm run prepare
npx husky add .husky/pre-commit "npx lint-staged"

# setup commitlint
npm install --save-dev @commitlint/{cli,config-conventional}
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js
npx husky add .husky/commit-msg  'npx --no -- commitlint --edit ${1}'
