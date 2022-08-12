FIRST_LINE = '// ==UserScript=='
LAST_LINE = '// ==/UserScript=='

class Header
  constructor: (fields) ->
    @fields = if fields then fields else []
  @fromObject: (object) ->
    fields = Object.entries(object).reduce(
      (acc, [key, value]) ->
        if Array.isArray value
          for item from value
            acc.push({ name: key, value: item })
          return acc
        acc.push({ name: key, value: value })
        return acc
      []
    )
    return new Header fields
  maxNameLength: ->
    max = 0
    for field from @fields
      max = field.name.length if field.name.length > max
    return max + 1
  toString: ->
    maxNameLength = @maxNameLength()
    body = @fields.map (field) ->
      "// @#{field.name.padEnd(maxNameLength)} #{field.value}"
    return [FIRST_LINE, ...body, LAST_LINE].join("\n")

module.exports = Header
