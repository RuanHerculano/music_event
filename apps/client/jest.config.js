module.exports = {
  preset: "@vue/cli-plugin-unit-jest",
  collectCoverage: true,
  collectCoverageFrom: [
    "<rootDir>/src/**/*.{js,jsx}",
    "!<rootDir>/src/i18n.js",
    "!<rootDir>/src/router/**/*.js",
    "!<rootDir>/src/main.js",
    "!<rootDir>/src/registerServiceWorker.js",
    "!<rootDir>/src/**/index.js"
  ],
  testMatch: [
    "<rootDir>/tests/unit/**/*.spec.(js|jsx|ts|tsx)",
    "<rootDir>/**/*.spec.(js|jsx|ts|tsx)"
  ],
  setupFilesAfterEnv: ["<rootDir>/tests/setupTests.js"]
};
