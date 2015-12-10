# Script [![Build Status](http://img.shields.io/travis/rgbkrk/atom-script.svg?style=flat)](https://travis-ci.org/rgbkrk/atom-script)
**Run code in Atom!**

Run scripts based on file name, a selection of code, or by line number.

![](https://cloud.githubusercontent.com/assets/1694055/3226201/c458acbc-f067-11e3-84a0-da27fe334f5e.gif)

Currently supported grammars are:

  * AppleScript
  * Bash <sup>[**](#double-asterisk)</sup>
  * Behat Feature
  * C <sup>[*](#asterisk)</sup><sup>[‡](#double-dagger)</sup>
  * C++ <sup>[*](#asterisk)</sup><sup>[‡](#double-dagger)</sup>
  * C# Script <sup>[*](#asterisk)</sup>
  * Coffeescript
  * CoffeeScript (Literate) <sup>[^](#caret)</sup>
  * Crystal
  * Cucumber (Gherkin) <sup>[*](#asterisk)</sup>
  * D <sup>[*](#asterisk)</sup>
  * DOT (Graphviz)
  * Elixir
  * Erlang <sup>[†](#dagger)</sup>
  * F# <sup>[*](#asterisk)</sup>
  * Forth (via GForth)
  * Go <sup>[*](#asterisk)</sup>
  * Groovy
  * Haskell
  * Java
  * Javascript
  * [JavaScript for Automation](https://developer.apple.com/library/mac/releasenotes/InterapplicationCommunication/RN-JavaScriptForAutomation/Articles/Introduction.html) (JXA)
  * Julia
  * Kotlin
  * LaTeX (via latexmk)
  * LilyPond
  * Lisp (via SBCL) <sup>[⍵](#omega)</sup>
  * Literate Haskell <sup>[*](#asterisk)</sup>
  * LiveScript
  * Lua
  * Makefile
  * MoonScript
  * MongoDB
  * [NCL](http://ncl.ucar.edu)<sup>[#](#hash)</sup>
  * newLISP
  * Nim (and NimScript)
  * NSIS
  * Objective-C <sup>[*](#asterisk)</sup><sup>[‡](#double-dagger)</sup>
  * Objective-C++ <sup>[*](#asterisk)</sup><sup>[‡](#double-dagger)</sup>
  * OCaml <sup>[*](#asterisk)</sup>
  * Pandoc Markdown <sup>[††](#two-daggers)</sup>
  * Perl
  * Perl 6
  * PHP
  * PostgreSQL <sup>[§](#section)</sup>
  * Python
  * RSpec
  * Racket
  * [RANT](https://github.com/TheBerkin/Rant)
  * Ruby
  * Ruby on Rails
  * Rust
  * Sage
  * Sass/SCSS <sup>[*](#asterisk)</sup>
  * Scala
  * Shell Script <sup>[**](#double-asterisk)</sup>
  * Swift
  * TypeScript
  * Dart
  * Octave
  * Zsh <sup>[**](#double-asterisk)</sup>

**NOTE**: Some grammars may require you to install [a custom language package](https://atom.io/search?utf8=✓&q=language).

You only have to add a few lines in a PR to support another.

### Limitations

<a name="caret"></a><sup>^</sup> Running selections of code for CoffeeScript (Literate) only works when selecting just the code blocks

<a name="dagger"></a><sup>†</sup> Erlang uses `erl` for limited selection based runs (see [#70](https://github.com/rgbkrk/atom-script/pull/70))

<a name="asterisk"></a><sup>*</sup> Cucumber (Gherkin), D, Go, F#, Literate Haskell, OCaml, PowerShell, and Swift do not support selection based runs

<a name="omega"></a><sup>⍵</sup> Lisp selection based runs are limited to single line

<a name="double-dagger"></a><sup>‡</sup> C, C++, Objective-C, and Objective-C++ are currently only available for Mac OS X (where `process.platform is 'darwin'`). This is possible due to the commands `xcrun clang` and `xcrun clang++`. **NOTE**: Xcode and the Xcode command line tools are required to ensure `xcrun` and the correct compilers on your system.

<a name="hash"></a><sup>#</sup> NCL scripts must end with `exit` command for file based runs

<a name="two-daggers"></a><sup>††</sup> Requires the panzer pandoc wrapper https://github.com/msprev/panzer and the pandoc-flavored-markdown language package in Atom https://atom.io/packages/language-pfm

<a name="section"></a><sup>§</sup> Requires the atom-language-pgsql package in
Atom https://atom.io/packages/language-pgsql.  Connects as user `$PGUSER` to
database `$PGDATABASE`. Both default to the operating system's user name and both
can be set in the process environment or in Atom's `init.coffee` script:
`process.env.PGUSER = ⟨username⟩` and `process.env.PGDATABASE = ⟨database name⟩`.

<a name="double-asterisk"></a><sup>\**</sup> The shell used is based on your default `$SHELL` environment variable.

## Installation

`apm install script`

or

Search for `script` within package search in the Settings View.

## Atom can't find node | ruby | python | my socks

Make sure to launch Atom from the console/terminal. This gives atom all your useful environment variables. Additionally, make sure to run it with the project path you need. For example, use

```
atom .
```

to get it to run with the *current* directory as the default place to run scripts from.

If you *really* wish to open atom from a launcher/icon, see [this issue for a variety of workarounds that have been suggested](https://github.com/rgbkrk/atom-script/issues/61#issuecomment-37337827).

## Usage

Make sure to run `atom` from the command line to get full access to your environment variables. Running Atom from the icon will launch using launchctl's environment.

**Script: Run** will perform a "File Based" run when no text is selected (default).

**Script: Run** while text is selected will perform a "Selection Based" run executing just the highlighted code.

**Script: Run by Line Number** to run using the specified line number. **Note** that if you select an entire line this number could be off by one due to the way Atom detects numbers while text is selected.

**Script: Run Options** should be used to configure command options, program arguments, and environment variables overrides. Environment variables may be input into the options view in the form `VARIABLE_NAME_ONE=value;VARIABLE_NAME_TWO="other value";VARIABLE_NAME_3='test'`

**Script: Kill Process** will kill the process but leaves the pane open.

**Script: Close View** closes the pane and kills the process.

To kill everything, click the close icon in the upper right and just go back to
coding.

**Script: Copy Run Results** copies everything written to the output pane to the
clipboard, allowing you to paste it into the editor.

### Command and shortcut reference

| Command                    | Mac OS X                            | Linux/Windows               | Notes                                                                         |
|:---------------------------|:------------------------------------|:----------------------------|:------------------------------------------------------------------------------|
| Script: Run                | <kbd>cmd-i</kbd>                    | <kbd>shift-ctrl-b</kbd>     | If text is selected a "Selection Based" is used instead of a "File Based" run |
| Script: Run by Line Number | <kbd>shift-cmd-j</kbd>              | <kbd>shift-ctrl-j</kbd>     | If text is selected the line number will be the last                          |
| Script: Run Options        | <kbd>shift-cmd-i</kbd>              | <kbd>shift-ctrl-alt-o</kbd> | Runs the selection or whole file with the given options                       |
| Script: Close View         | <kbd>esc</kbd> or <kbd>ctrl-w</kbd> | <kbd>esc</kbd>              | Closes the script view window                                                 |
| Script: Kill Process       | <kbd>ctrl-c</kbd>                   | <kbd>ctrl-q</kbd>           | Kills the current script process                                              |

## Development

Use the atom [contributing guidelines](https://atom.io/docs/latest/contributing).
They're pretty sane.

#### Quick and dirty setup

`apm develop script`

This will clone the `script` repository to `~/github` unless you set the
`ATOM_REPOS_HOME` environment variable.

#### I already cloned it!

If you cloned it somewhere else, you'll want to use `apm link --dev` within the
package directory, followed by `apm install` to get dependencies.

### Workflow

After pulling upstream changes, make sure to run `apm update`.

To start hacking, make sure to run `atom --dev` from the package directory.
Cut a branch while you're working then either submit a Pull Request when done
or when you want some feedback!
