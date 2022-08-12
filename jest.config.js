module.exports = {
  transform: {
    "\\.coffee$": "<rootDir>/../jest-coffee.js",
  },
  testRegex: ["\\.test\\.coffee$"],
  rootDir: "src",
  moduleFileExtensions: ["js", "coffee"]
};
