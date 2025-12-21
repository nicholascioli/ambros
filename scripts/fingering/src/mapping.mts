export interface Mappings {
  reference: MappingReference;
  outputs: MappingOutputs;
}

export interface MappingReference {
  left: Mapping<Array<number>>;
  right: Mapping<Array<number>>;
}

export interface MappingOutputs {
  left: Mapping<Record<string, string>>;
  right: Mapping<Record<string, string>>;
}

export interface Mapping<T> {
  open: T;
  close: T;
}
