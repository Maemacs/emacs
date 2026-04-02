# MaeMacs!

![The default emacs logo](.assets/splash.svg)

## IMPORTANT!

Please ensure you have emacs v31 installed, I recommend compiling from source!

[Git repository](https://github.com/emacs-mirror/emacs)

### Compiling emacs from source

```bash
git clone https://github.com/emacs-mirror/emacs && cd emacs
```

*IMPORTANT* Make sure to add: `--with-pgtk` if you are on wayland

```bash
./configure \
  CFLAGS="-O2 -pipe -march=native" \
  -C \
  --tree-sitter \
  --imagemagick \
  --cairo \
  --with-native-compilation
```

```bash
make -j
```

Copy `src/emacs` to wherever you want into your path
```bash
src/emacs
```

## NOTE

When starting emacs for the first time, run it once, exit and open again
