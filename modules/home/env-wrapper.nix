{ lib, pkgs, ... }:

let
  # Function to wrap a package with custom environment variables
  makeWrappedPackage = pkg: envVars: pkgs.stdenv.mkDerivation {
    name = "env-wrap-${pkg.name}";
    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildCommand = ''
      mkdir -p $out/bin
      for exe in ${lib.getExe pkg}; do
        exeName=$(basename "$exe")
        makeWrapper "$exe" "$out/bin/$exeName" \
          ${lib.concatMapStringsSep " " (kv: "--set ${kv.name} ${kv.value}") (lib.attrsToList envVars)}
      done
    '';
  };
in {
  wrap = pkg: envVars: makeWrappedPackage pkg envVars;
}
