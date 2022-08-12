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
