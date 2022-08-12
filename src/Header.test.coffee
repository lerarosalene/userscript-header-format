Header = require "./Header.coffee"

EXAMPLE_HEADER_DATA =
  name: "Name"
  namespace: "https://lerarosalene.github.io"
  version: "0.1.1"
  description: "Description"
  author: "Larissa Rosalene"
  match: ["http*://github.com/*", "http*://gitlab.com/*"]
  grant: ["GM_cookie", "GM.cookie"]

EXAMPLE_HEADER_FIELDS = [
  { name: "name", value: "Name" },
  { name: "namespace", value: "https://lerarosalene.github.io" },
  { name: "version", value: "0.1.1" },
  { name: "description", value: "Description" },
  { name: "author", value: "Larissa Rosalene" },
  { name: "match", value: "http*://github.com/*" },
  { name: "match", value: "http*://gitlab.com/*" },
  { name: "grant", value: "GM_cookie" },
  { name: "grant", value: "GM.cookie" }
]

EXPECTED_RESULT = """
// ==UserScript==
// @name         Name
// @namespace    https://lerarosalene.github.io
// @version      0.1.1
// @description  Description
// @author       Larissa Rosalene
// @match        http*://github.com/*
// @match        http*://gitlab.com/*
// @grant        GM_cookie
// @grant        GM.cookie
// ==/UserScript==
"""

describe "Header class", () ->
  it "must return correctly formatted userscript header", () ->
    header = Header.fromObject EXAMPLE_HEADER_DATA
    result = header.toString()
    expect(result).toBe EXPECTED_RESULT
  it "must support initialization from field list", () ->
    header = new Header EXAMPLE_HEADER_FIELDS
    result = header.toString()
    expect(result).toBe EXPECTED_RESULT
