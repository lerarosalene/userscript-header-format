# Userscript header formatter

[![release](https://github.com/lerarosalene/userscript-header-format/actions/workflows/build.yaml/badge.svg)](#)
[![npm](https://badge.fury.io/js/userscript-header-format.svg)](https://npmjs.com/package/userscript-header-format)

Tool to format userscript headers from js.

## Usage:

```ts
import UserscriptHeader from "userscript-header-formatter";

const header = UserscriptHeader.fromObject({
  name: "My cool userscript",
  namespace: "https://example.com",
  version: "0.1.0",
  description: "very cool indeed",
  author: "me",
  match: [
    "https://github.com/*",
    "https://gitlab.com/*"
  ]
}).toString();

```

Header, generated from this code will be:

```js
// ==UserScript==
// @name         My cool userscript
// @namespace    https://example.com
// @version      0.1.0
// @description  very cool indeed
// @author       me
// @match        https://github.com/*
// @match        https://gitlab.com/*
// ==/UserScript==
```

## Api declarations

```ts
type Value = string | number;

interface Field {
  name: string;
  value: Value;
}

interface HeaderDescriptor {
  [index: string]: Value | Array<Value>;
}

declare class Header {
  constructor(fields: Field[]);
  static fromObject(object: HeaderDescriptor): Header;
  toString(): string;
}

export default Header;
```
