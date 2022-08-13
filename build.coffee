{ readFile, mkdir, copyFile } = require "node:fs/promises"
{ join, basename } = require "node:path"
coffee = require "coffeescript"
esbuild = require "esbuild"

class CoffePlugin
  constructor: ->
    @name = "CoffePlugin"
  setup: (build) ->
    build.onLoad { filter: /\.coffee$/ }, (args) ->
      source = await readFile args.path, "utf-8"
      js = coffee.compile source, { bare: true, inlineMap: true, filename: basename(args.path) }
      return { contents: js, loader: 'js' }

main = ->
  await esbuild.build(
    entryPoints: [join "src", "Header.coffee"]
    bundle: true
    format: "cjs"
    outfile: join "lib", "index.js"
    loader:
      ".coffee": "js"
    plugins: [new CoffePlugin]
  )
  await copyFile join("src", "Header.d.ts"), join("lib", "index.d.ts")


main().catch (error) ->
  console.error error
  process.exit 1
