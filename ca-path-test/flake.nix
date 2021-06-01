{
  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        here = ./.;

        # Trying to ignore changes to flake.nix to avoid rebuilding the project.
        filteredSrc = builtins.path {
          path = here;
          filter = path: type: builtins.baseNameOf path == "flake.nix";
          # Unfortunately, it still produces a different output path
          # since any change will cause the flake to be re-cloned.
          # https://github.com/NixOS/nix/issues/3732
        };

        # Due to a Nix bug, we cannot actually use the builtins.path output
        # for IFD in a flake directly and need to copy it to a new derivation.
        # https://github.com/NixOS/nix/issues/3234
        src = pkgs.runCommand "test-src" {
          # Previously, this produced a different output path whenever we changed anything in the flake,
          # even though it mostly had the same contents – prime candidate for CA derivation.
          # Unfortunately, it prevents us from IFD since it turns the output path into a “reference”.
          # trace: src: /15m1sz27izr8ywdq8s2ps6idz0j2l4v69nz8d01zw56l1xi7j6fz
          __contentAddressed = true;
        } "cp -r '${filteredSrc}' $out";

        # Trying to work around it by having another derivation depend on the ca derivation.
        # But that itself just turns into a reference – trace: srcPath: /0n3197jb6ymfim2whssvasnf978438q3dz0dg3imj1p5n6jqv2ny
        srcPath = pkgs.runCommand "test-src-path" { } "echo ${src} > $out";
      in
      builtins.trace "here: ${here}"
      builtins.trace "filteredSrc: ${filteredSrc}"
      builtins.trace "src: ${src}"
      builtins.trace "srcPath: ${srcPath}"
      builtins.trace "foo-contents: ${builtins.readFile "${src}/foo"}"
      src;
  };
}
