# Maps Atom Grammar names to the command used by that language
# As well as any special setup for arguments.

_ = require 'underscore'
GrammarUtils = require '../lib/grammar-utils'

module.exports =
  '1C (BSL)':
    'File Based':
      command: "oscript"
      args: (context) -> ['-encoding=utf-8', context.filepath]

  Ansible:
    "File Based":
      command: "ansible-playbook"
      args: (context) -> [context.filepath]

  AppleScript:
    'Selection Based':
      command: 'osascript'
      args: (context)  -> ['-e', context.getCode()]
    'File Based':
      command: 'osascript'
      args: (context) -> [context.filepath]

  'Babel ES6 JavaScript':
    "Selection Based":
      command: "babel-node"
      args: (context) -> ['-e', context.getCode()]
    "File Based":
      command: "babel-node"
      args: (context) -> [context.filepath]

  Batch:
    "File Based":
      command: ""
      args: (context) -> [context.filepath]

  'Behat Feature':
    "File Based":
      command: "behat"
      args: (context) -> [context.filepath]
    "Line Number Based":
      command: "behat"
      args: (context) -> [context.fileColonLine()]

  C:
    if GrammarUtils.OperatingSystem.isDarwin()
      "File Based":
        command: "bash"
        args: (context) -> ['-c', "xcrun clang -fcolor-diagnostics -Wall -include stdio.h '" + context.filepath + "' -o /tmp/c.out && /tmp/c.out"]
    else if GrammarUtils.OperatingSystem.isLinux()
      "File Based":
        command: "bash"
        args: (context) -> ["-c", "cc -Wall -include stdio.h '" + context.filepath + "' -o /tmp/c.out && /tmp/c.out"]

  'C# Script File':
    "File Based":
      command: "scriptcs"
      args: (context) -> ['-script', context.filepath]

  'C++':
    if GrammarUtils.OperatingSystem.isDarwin()
      "File Based":
        command: "bash"
        args: (context) -> ['-c', "xcrun clang++ -fcolor-diagnostics -Wc++11-extensions -Wall -include stdio.h -include iostream '" + context.filepath + "' -o /tmp/cpp.out && /tmp/cpp.out"]
    else if GrammarUtils.OperatingSystem.isLinux()
      "File Based":
        command: "bash"
        args: (context) -> ["-c", "g++ -Wall -include stdio.h -include iostream '" + context.filepath + "' -o /tmp/cpp.out && /tmp/cpp.out"]

  Clojure:
    "Selection Based":
      command: "lein"
      args: (context)  -> ['exec', '-e', context.getCode()]
    "File Based":
      command: "lein"
      args: (context) -> ['exec', context.filepath]

  CoffeeScript:
    "Selection Based":
      command: "coffee"
      args: (context) -> GrammarUtils.CScompiler.args.concat [context.getCode()]
    "File Based":
      command: "coffee"
      args: (context) -> [context.filepath]

  "CoffeeScript (Literate)":
    'Selection Based':
      command: 'coffee'
      args: (context) -> GrammarUtils.CScompiler.args.concat [context.getCode()]
    'File Based':
      command: 'coffee'
      args: (context) -> [context.filepath]

  Crystal:
    "Selection Based":
      command: "crystal"
      args: (context)  -> ['eval', context.getCode()]
    "File Based":
      command: "crystal"
      args: (context) -> [context.filepath]

  D:
    "File Based":
      command: "rdmd"
      args: (context) -> [context.filepath]

  Dart:
    "File Based":
      command: "dart"
      args: (context) -> [context.filepath]

  DOT:
    "File Based":
      command: "dot"
      args: (context) -> ['-Tpng', context.filepath, '-o', context.filepath + '.png']

  Elixir:
    "Selection Based":
      command: "elixir"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "elixir"
      args: (context) -> ['-r', context.filepath]

  Erlang:
    "Selection Based":
      command: "erl"
      args: (context)  -> ['-noshell', '-eval', "#{context.getCode()}, init:stop()."]

  'F#':
    "File Based":
      command: if GrammarUtils.OperatingSystem.isWindows() then "fsi" else "fsharpi"
      args: (context) -> ['--exec', context.filepath]

  Forth:
    "File Based":
      command: "gforth"
      args: (context) -> [context.filepath]

  "Fortran - Fixed Form":
    "File Based":
      command: "bash"
      args: (context) -> ['-c', "gfortran '" + context.filepath + "' -ffixed-form -o /tmp/f.out && /tmp/f.out"]

  "Fortran - Free Form":
    "File Based":
      command: "bash"
      args: (context) -> ['-c', "gfortran '" + context.filepath + "' -ffree-form -o /tmp/f90.out && /tmp/f90.out"]

  "Fortran - Modern":
    "File Based":
      command: "bash"
      args: (context) -> ['-c', "gfortran '" + context.filepath + "' -ffree-form -o /tmp/f90.out && /tmp/f90.out"]

  "Fortran - Punchcard":
    "File Based":
      command: "bash"
      args: (context) -> ['-c', "gfortran '" + context.filepath + "' -ffixed-form -o /tmp/f.out && /tmp/f.out"]

  Gherkin:
    "File Based":
      command: "cucumber"
      args: (context) -> ['--color', context.filepath]
    "Line Number Based":
      command: "cucumber"
      args: (context) -> ['--color', context.fileColonLine()]

  gnuplot:
    "File Based":
      command: "gnuplot"
      args: (context) -> ['-p', context.filepath]
      workingDirectory: atom.workspace.getActivePaneItem()?.buffer?.file?.getParent?().getPath?()

  Go:
    "File Based":
      command: "go"
      args: (context) ->
        if context.filepath.match(/_test.go/) then ['test', '' ]
        else ['run', context.filepath]
      workingDirectory: atom.workspace.getActivePaneItem()?.buffer?.file?.getParent?().getPath?()

  Groovy:
    "Selection Based":
      command: "groovy"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "groovy"
      args: (context) -> [context.filepath]

  Haskell:
    "File Based":
      command: "runhaskell"
      args: (context) -> [context.filepath]
    "Selection Based":
      command: "ghc"
      args: (context)  -> ['-e', context.getCode()]

  IcedCoffeeScript:
    "Selection Based":
      command: "iced"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "iced"
      args: (context) -> [context.filepath]

  ioLanguage:
    "Selection Based":
      command: "io"
      args: (context) -> [context.getCode()]
    "File Based":
      command: "io"
      args: (context) -> ['-e', context.filepath]

  Java:
    "File Based":
      command: if GrammarUtils.OperatingSystem.isWindows() then "cmd" else "bash"
      args: (context) ->
        className = context.filename.replace /\.java$/, ""
        args = []
        if GrammarUtils.OperatingSystem.isWindows()
          args = ["/c javac -Xlint #{context.filename} && java #{className}"]
        else
          args = ['-c', "javac -d /tmp '#{context.filepath}' && java -cp /tmp #{className}"]
        return args

  JavaScript:
    "Selection Based":
      command: "node"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "node"
      args: (context) -> [context.filepath]

  "JavaScript for Automation (JXA)":
    "Selection Based":
      command: "osascript"
      args: (context)  -> ['-l', 'JavaScript', '-e', context.getCode()]
    "File Based":
      command: "osascript"
      args: (context) -> ['-l', 'JavaScript', context.filepath]

  Jolie:
    "File Based":
      command: "jolie"
      args: (context) -> [context.filepath]

  Julia:
    "Selection Based":
      command: "julia"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "julia"
      args: (context) -> [context.filepath]

  Kotlin:
    "Selection Based":
      command: "bash"
      args: (context) ->
        code = context.getCode(true)
        tmpFile = GrammarUtils.createTempFileWithCode(code, ".kt")
        jarName = tmpFile.replace /\.kt$/, ".jar"
        args = ['-c', "kotlinc #{tmpFile} -include-runtime -d #{jarName} && java -jar #{jarName}"]
        return args
    "File Based":
      command: "bash"
      args: (context) ->
        jarName = context.filename.replace /\.kt$/, ".jar"
        args = ['-c', "kotlinc #{context.filepath} -include-runtime -d /tmp/#{jarName} && java -jar /tmp/#{jarName}"]
        return args

  LaTeX:
    "File Based":
      command: "latexmk"
      args: (context) -> ['-cd', '-quiet', '-pdf', '-pv', '-shell-escape', context.filepath]

  'LaTeX Beamer':
    "File Based":
      command: "latexmk"
      args: (context) -> ['-cd', '-quiet', '-pdf', '-pv', '-shell-escape', context.filepath]

  LilyPond:
    "File Based":
      command: "lilypond"
      args: (context) -> [context.filepath]

  Lisp:
    "Selection Based":
      command: "sbcl"
      args: (context) ->
        statements = _.flatten(_.map(GrammarUtils.Lisp.splitStatements(context.getCode()), (statement) -> ['--eval', statement]))
        args = _.union ['--noinform', '--disable-debugger', '--non-interactive', '--quit'], statements
        return args
    "File Based":
      command: "sbcl"
      args: (context) -> ['--noinform', '--script', context.filepath]

  'Literate Haskell':
    "File Based":
      command: "runhaskell"
      args: (context) -> [context.filepath]

  LiveScript:
    "Selection Based":
      command: "lsc"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "lsc"
      args: (context) -> [context.filepath]

  Lua:
    "Selection Based":
      command: "lua"
      args: (context) ->
        code = context.getCode(true)
        tmpFile = GrammarUtils.createTempFileWithCode(code)
        [tmpFile]
    "File Based":
      command: "lua"
      args: (context) -> [context.filepath]

  Makefile:
    "Selection Based":
      command: "bash"
      args: (context) -> ['-c', context.getCode()]
    "File Based":
      command: "make"
      args: (context) -> ['-f', context.filepath]

  MagicPython:
    "Selection Based":
      command: "python"
      args: (context)  -> ['-u', '-c', context.getCode()]
    "File Based":
      command: "python"
      args: (context) -> ['-u', context.filepath]

  MATLAB:
    "Selection Based":
      command: "matlab"
      args: (context) ->
        code = context.getCode()
        tmpFile = GrammarUtils.MATLAB.createTempFileWithCode(code)
        ['-nodesktop','-nosplash','-nojvm','-nodisplay','-r',"try, run('" + tmpFile + "'), catch ME, disp(ME.message);,exit(1);, end, exit(0);"]
    "File Based":
      command: "matlab"
      args: (context) -> ['-nodesktop','-nosplash','-nojvm','-nodisplay','-r',"try, run('" + context.filepath + "'), catch ME, disp(ME.message);,exit(1);, end, exit(0);"]

  MoonScript:
    "Selection Based":
      command: "moon"
      args: (context) -> ['-e', context.getCode()]
    "File Based":
      command: "moon"
      args: (context) -> [context.filepath]

  'mongoDB (JavaScript)':
    "Selection Based":
      command: "mongo"
      args: (context) -> ['--eval', context.getCode()]
    "File Based":
      command:  "mongo"
      args: (context) -> [context.filepath]

  NCL:
    "Selection Based":
      command: "ncl"
      args: (context) ->
        code = context.getCode(true)
        code = code + """

        exit"""
        tmpFile = GrammarUtils.createTempFileWithCode(code)
        [tmpFile]
    "File Based":
      command: "ncl"
      args: (context) -> [context.filepath]

  newLISP:
    "Selection Based":
      command: "newlisp"
      args: (context) -> ['-e', context.getCode()]
    "File Based":
      command: "newlisp"
      args: (context) -> [context.filepath]

  Nim:
    "File Based":
      command: "bash"
      args: (context) ->
        file = GrammarUtils.Nim.findNimProjectFile(context.filepath)
        path = GrammarUtils.Nim.projectDir(context.filepath)
        ['-c', 'cd "' + path + '" && nim c --hints:off --parallelBuild:1 -r "' + file + '" 2>&1']

  NSIS:
    "Selection Based":
      command: "makensis"
      args: (context) ->
        code = context.getCode()
        tmpFile = GrammarUtils.createTempFileWithCode(code)
        [tmpFile]
    "File Based":
      command: "makensis"
      args: (context) -> [context.filepath]

  'Objective-C':
    if GrammarUtils.OperatingSystem.isDarwin()
      "File Based":
        command: "bash"
        args: (context) -> ['-c', "xcrun clang -fcolor-diagnostics -Wall -include stdio.h -framework Cocoa " + context.filepath + " -o /tmp/objc-c.out && /tmp/objc-c.out"]

  'Objective-C++':
    if GrammarUtils.OperatingSystem.isDarwin()
      "File Based":
        command: "bash"
        args: (context) -> ['-c', "xcrun clang++ -fcolor-diagnostics -Wc++11-extensions -Wall -include stdio.h -include iostream -framework Cocoa " + context.filepath + " -o /tmp/objc-cpp.out && /tmp/objc-cpp.out"]

  OCaml:
    "File Based":
      command: "ocaml"
      args: (context) -> [context.filepath]

  Octave:
    "Selection Based":
      command: "octave"
      args: (context) -> ['-p', context.filepath.replace(/[^\/]*$/, ''), '--eval', context.getCode()]
    "File Based":
      command: "octave"
      args: (context) -> ['-p', context.filepath.replace(/[^\/]*$/, ''), context.filepath]

  'Pandoc Markdown':
    "File Based":
      command: "panzer"
      args: (context) -> [context.filepath, "--output=" + context.filepath + ".pdf"]

  Perl:
    "Selection Based":
      command: "perl"
      args: (context) ->
        code = context.getCode()
        file = GrammarUtils.Perl.createTempFileWithCode(code)
        [file]
    "File Based":
      command: "perl"
      args: (context) -> [context.filepath]

  "Perl 6":
    "Selection Based":
      command: "perl6"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "perl6"
      args: (context) -> [context.filepath]

  "Perl 6 FE":
    "Selection Based":
      command: "perl6"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "perl6"
      args: (context) -> [context.filepath]

  PHP:
    "Selection Based":
      command: "php"
      args: (context) ->
        code = context.getCode()
        file = GrammarUtils.PHP.createTempFileWithCode(code)
        [file]
    "File Based":
      command: "php"
      args: (context) -> [context.filepath]

  PowerShell:
    "File Based":
      command: "powershell"
      args: (context) -> [context.filepath.replace /\ /g, "` "]

  Prolog:
    "File Based":
      command: "bash"
      args: (context) -> ['-c', 'cd \"' + context.filepath.replace(/[^\/]*$/, '') + '\"; swipl -f \"' + context.filepath + '\" -t main --quiet']

  Python:
    "Selection Based":
      command: "python"
      args: (context)  -> ['-u', '-c', context.getCode()]
    "File Based":
      command: "python"
      args: (context) -> ['-u', context.filepath]

  R:
    "Selection Based":
      command: "Rscript"
      args: (context) ->
        code = context.getCode()
        file = GrammarUtils.R.createTempFileWithCode(code)
        [file]
    "File Based":
      command: "Rscript"
      args: (context) -> [context.filepath]

  Racket:
    "Selection Based":
      command: "racket"
      args: (context) -> ['-e', context.getCode()]
    "File Based":
      command: "racket"
      args: (context) -> [context.filepath]

  RANT:
    "Selection Based":
      command: "RantConsole.exe"
      args: (context) ->
        code = context.getCode(true)
        tmpFile = GrammarUtils.createTempFileWithCode(code)
        ['-file', tmpFile]
    "File Based":
      command: "RantConsole.exe"
      args: (context) -> ['-file', context.filepath]

  RSpec:
    "Selection Based":
      command: "ruby"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "rspec"
      args: (context) -> ['--tty', '--color', context.filepath]
    "Line Number Based":
      command: "rspec"
      args: (context) -> ['--tty', '--color', context.fileColonLine()]

  Ruby:
    "Selection Based":
      command: "ruby"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "ruby"
      args: (context) -> [context.filepath]

  'Ruby on Rails':
    "Selection Based":
      command: "rails"
      args: (context)  -> ['runner', context.getCode()]
    "File Based":
      command: "rails"
      args: (context) -> ['runner', context.filepath]

  Rust:
    "File Based":
      command: if GrammarUtils.OperatingSystem.isWindows() then "cmd" else "bash"
      args: (context) ->
        progname = context.filename.replace /\.rs$/, ""
        args = []
        if GrammarUtils.OperatingSystem.isWindows()
          args = ["/c rustc #{context.filepath} && #{progname}.exe"]
        else
          args = ['-c', "rustc '#{context.filepath}' -o /tmp/rs.out && /tmp/rs.out"]
        return args

  Sage:
    "Selection Based":
      command: "sage"
      args: (context) -> ['-c', context.getCode()]
    "File Based":
      command: "sage"
      args: (context) -> [context.filepath]

  Sass:
    "File Based":
      command: "sass"
      args: (context) -> [context.filepath]

  Scala:
    "Selection Based":
      command: "scala"
      args: (context)  -> ['-e', context.getCode()]
    "File Based":
      command: "scala"
      args: (context) -> [context.filepath]

  Scheme:
    "Selection Based":
      command: "guile"
      args: (context)  -> ['-c', context.getCode()]
    "File Based":
      command: "guile"
      args: (context) -> [context.filepath]

  SCSS:
    "File Based":
      command: "sass"
      args: (context) -> [context.filepath]

  "Shell Script":
    "Selection Based":
      command: process.env.SHELL
      args: (context)  -> ['-c', context.getCode()]
    "File Based":
      command: process.env.SHELL
      args: (context) -> [context.filepath]

  "Shell Script (Fish)":
    "Selection Based":
      command: "fish"
      args: (context)  -> ['-c', context.getCode()]
    "File Based":
      command: "fish"
      args: (context) -> [context.filepath]

  "SQL (PostgreSQL)":
    "Selection Based":
      command: "psql"
      args: (context) -> ['-c', context.getCode()]
    "File Based":
      command: "psql"
      args: (context) -> ['-f', context.filepath]

  "Standard ML":
    "File Based":
      command: "sml"
      args: (context) -> [context.filepath]

  Stata:
    "Selection Based":
      command: "xstata-se"
      args: (context)  -> ['do', context.getCode()]
    "File Based":
      command: "xstata-se"
      args: (context) -> ['do', context.filepath]

  Swift:
    "File Based":
      command: "swift"
      args: (context) -> [context.filepath]

  Tcl:
    "Selection Based":
      command: "tclsh"
      args: (context) ->
        code = context.getCode()
        tmpFile = GrammarUtils.createTempFileWithCode(code)
        [tmpFile]
    "File Based":
      command: "tclsh"
      args: (context) -> [context.filepath]

  TypeScript:
    "Selection Based":
      command: "bash"
      args: (context) ->
        code = context.getCode(true)
        tmpFile = GrammarUtils.createTempFileWithCode(code, ".ts")
        jsFile = tmpFile.replace /\.ts$/, ".js"
        args = ['-c', "tsc --out '#{jsFile}' '#{tmpFile}' && node '#{jsFile}'"]
        return args
    "File Based":
      command: "bash"
      args: (context) -> ['-c', "tsc '#{context.filepath}' --out /tmp/js.out && node /tmp/js.out"]
