export interface Mappings {
  reference: MappingReference;
  outputs: MappingOutputs;
}

export interface MappingReference {
  left: Mapping<Array<number>>;
  right: Mapping<Array<number>>;
}

export interface MappingOutputs {
  left: Mapping<Record<string, Output>>;
  right: Mapping<Record<string, Output>>;
}

export interface Mapping<T> {
  open: T;
  close: T;
}

export type Output = string | OutputOptions;
export type AccidentalMode = "sharp" | "flat" | "both";

export interface OutputOptions {
  filter: string;
  accidentals: AccidentalMode;
}
