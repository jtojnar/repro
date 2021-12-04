# yarn2nix-incomprehensible-error

> **Turns out the hash fragment of the `resolved` URL is the `sha1` hash of the tarball and newer versions of Yarn no longer include it according to https://github.com/NixOS/nixpkgs/pull/119522.**

When I try to build the simple npm package in this directory using yarn2nix, it fails with a trace that has little to do with the error (probably because yarn2nix uses IFD):

```ShellSession
$ nix-build -A package --show-trace
error: hash 'undefined' has wrong length for hash type 'sha1'

       … while evaluating 'escapeShellArg'

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/lib/strings.nix:318:20:

          317|   */
          318|   escapeShellArg = arg: "'${replaceStrings ["'"] ["'\\''"] (toString arg)}'";
             |                    ^
          319|

       … from call site

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/build-support/trivial-builders.nix:420:19:

          419|           mkdir -p "$(dirname ${lib.escapeShellArg x.name})"
          420|           ln -s ${lib.escapeShellArg x.path} ${lib.escapeShellArg x.name}
             |                   ^
          421|       '') entries}

       … while evaluating anonymous lambda

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/build-support/trivial-builders.nix:418:31:

          417|       cd $out
          418|       ${lib.concatMapStrings (x: ''
             |                               ^
          419|           mkdir -p "$(dirname ${lib.escapeShellArg x.name})"

       … from call site

       … while evaluating 'concatMapStrings'

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/lib/strings.nix:53:25:

           52|   */
           53|   concatMapStrings = f: list: concatStrings (map f list);
             |                         ^
           54|

       … from call site

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/build-support/trivial-builders.nix:418:9:

          417|       cd $out
          418|       ${lib.concatMapStrings (x: ''
             |         ^
          419|           mkdir -p "$(dirname ${lib.escapeShellArg x.name})"

       … while evaluating the attribute 'buildCommand' of the derivation 'offline'

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/stdenv/generic/make-derivation.nix:205:7:

          204|     // (lib.optionalAttrs (attrs ? name || (attrs ? pname && attrs ? version)) {
          205|       name =
             |       ^
          206|         let

       … while evaluating the attribute 'buildPhase' of the derivation 'yarn2nix-incomprehensible-error-modules-0.0.1'

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/stdenv/generic/make-derivation.nix:205:7:

          204|     // (lib.optionalAttrs (attrs ? name || (attrs ? pname && attrs ? version)) {
          205|       name =
             |       ^
          206|         let

       … while evaluating the attribute 'configurePhase' of the derivation 'yarn2nix-incomprehensible-error'

       at /nix/store/i3vjnn2vj4vnal3sckng5gagv7ssayjp-source/pkgs/stdenv/generic/make-derivation.nix:205:7:

          204|     // (lib.optionalAttrs (attrs ? name || (attrs ? pname && attrs ? version)) {
          205|       name =
             |       ^
          206|         let
```

Looking at [what `yarn2nix` does](https://github.com/NixOS/nixpkgs/blob/bb9bd465b625bfc971908c5d3d84ce517e1c0691/pkgs/development/tools/yarn2nix-moretea/yarn2nix/default.nix#L233), I tried building the `yarndeps.nix` file (`nix-build -A yarnNix`) and I see that it indeed contains `undefined` in place of a hash.

```nix
{ fetchurl, fetchgit, linkFarm, runCommand, gnutar }: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
    {
      name = "https___registry.npmjs.org_caniuse_lite___caniuse_lite_1.0.30001265.tgz";
      path = fetchurl {
        name = "https___registry.npmjs.org_caniuse_lite___caniuse_lite_1.0.30001265.tgz";
        url  = "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001265.tgz";
        sha1 = "undefined";
      };
    }
  ];
}
```

If I run `yarn2nix > yarndeps.nix` outside of sandbox, a hash is filled in correctly:

```nix
{ fetchurl, fetchgit, linkFarm, runCommand, gnutar }: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
    {
      name = "https___registry.npmjs.org_caniuse_lite___caniuse_lite_1.0.30001265.tgz";
      path = fetchurl {
        name = "https___registry.npmjs.org_caniuse_lite___caniuse_lite_1.0.30001265.tgz";
        url  = "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001265.tgz";
        sha1 = "0613c9e6c922e422792e6fcefdf9a3afeee4f8c3";
      };
    }
  ];
}
```

yarn2nix only seems to have an issue with this specific package – all other entries seemed to have been resolved correctly when I [discovered this](https://kolaente.dev/vikunja/frontend/issues/1137) in vikunja-frontend.
