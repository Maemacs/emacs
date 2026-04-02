# MaeMacs!

![The default emacs logo](.assets/splash.svg)

## This is expected to be put in: ~/.config/emacs

## IMPORTANT!

Please ensure you have emacs v31 installed, I recommend compiling from source!

[Git repository](https://github.com/emacs-mirror/emacs)

### Compiling emacs from source

```bash
git clone https://github.com/emacs-mirror/emacs && cd emacs
```

```bash
./configure \
  CFLAGS="-O2 -pipe -march=native" \
  -C \
  --with-pgtk \
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
