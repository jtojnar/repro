```ShellSession
$ cmake . -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Debug
$ ninja -C build
$ ./build/test foo
fish: Job 1, './build/test foo' terminated by signal SIGSEGV (Address boundary error)
```
