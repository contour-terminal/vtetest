# VTE Acid Tests

This repository is a collection of scripts I use for testing.

Currently this mostly means testing with respect to Unicode and complex Unicode codepoints
and how they're being rendered on various terminal emulators.

It is hard (if not impossible) to reliably create a test suite that can be used
to generically test any terminal emulator, I am instead providing a set of scripts
that can be used to test all kinds of terminal emulators against each other, with
maybe a screenshot how the output should ideally look like.

### What to test

- complex unicode codepoint rendering (anything that requires proper text shaping)
  - especially with respect to emojis)
  - CJK
  - cursor positioning verification tests
- sadly I don't see a generic way to properly test all VT sequences, but maybe
  a few of them could be tested just like CSS Acid Tests are provided. The resulting screen
  should then be easily comparible to a reference image.

### Terminal emulators of interest
----------------------------------

- alacritty
- contour
- gnome-terminal
- iterm2 (OS/X)
- kitty
- konsole
- mintty (Windows)
- mlterm
- rxvt-unicode
- st (default, and maybe with patches)
- terminal.app (OS/X)
- terminology
- terminator
- termite
- windows terminal (Windows)
- xterm
- xterm.js (such as Hyper)

There is no point in listing more than one terminal emulator that is using the
same underling VTE engine.

Did I miss anything?

### License

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
