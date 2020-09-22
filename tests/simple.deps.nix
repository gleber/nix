with import ./config.nix;

let {

  input0 = mkDerivation {
    name = "dependencies-input-0";
    buildCommand = "mkdir $out; echo foo > $out/bar";
  };

  body = mkDerivation {
    name = "dependencies-top";
    builder = ./simple.deps.builder.sh;
    input0 = input0 + "/.";
    meta.description = "Random test package";
  };

}
