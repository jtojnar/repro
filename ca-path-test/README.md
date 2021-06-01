Requires enabling CA as described in https://discourse.nixos.org/t/content-addressed-nix-call-for-testers/12881

See `flake.nix` for explanation.

```ShellSession
$ nix build
warning: Git tree '/home/jtojnar/Projects/repro' is dirty
trace: here: /nix/store/zgi7iar59fr5fyj075jaga42cbwkqfx2-ca-path-test
trace: filteredSrc: /nix/store/hzk11az2xqnwxw2dyx0y7dj1333y1bg1-ca-path-test
trace: src: /10553hgxfp95ixbpbf7gmaa2npafc0jw23hgw4bx6xwn8cqza919
trace: srcPath: /04b7spqqwx5k07ga4zzj35c01djplwd5rr78p2ixidzviss77yd8
error: access to path '/10553hgxfp95ixbpbf7gmaa2npafc0jw23hgw4bx6xwn8cqza919/foo' is forbidden in restricted mode
```
