const coffee = require('coffeescript');

module.exports = {
  process(sourceText, sourcePath) {
    const result = coffee.compile(sourceText, { sourceMap: true, filename: sourcePath });
    return {
      code: result.js,
      map: result.v3SourceMap,
    }
  }
}
