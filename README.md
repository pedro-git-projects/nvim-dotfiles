# NVim Dotfiles

## Custom Shortcuts

### General

'q' closes window

'ctrl w w' navigates trhough windows

'ctrl s' saves

'ctrl t' opens a vertical terminal

'ctrl ]' jumps to function definition

'ctrl T' jumps back from function definition

'gg = G' tides up files

### Explorer

'spc + e'  opens/closes explorer

'l' opens folder/file

'h' closes folder

'a' adds file

'A' adds folder

's' open split

'df' deletes file

'yp' copyFilepath

'yn' "copyFilename"

'yy' "copyFile"

'dd' 'cutFile'

'p' 'pasteFile'

### Go

Imports on save

Compile your package with **:GoBuild**, install it with **:GoInstall**  test with **:GoTest** and run with **:GoRun**.
Run a single test with **:GoTestFunc**

Debug programs with integrated delve support with **:GoDebugStart**.

Look up documentation with **:GoDoc** or **:GoDocBrowser**.

Easily import packages via **:GoImport**, remove them via **:GoDrop**.

Precise type-safe renaming of identifiers with **:GoRename.**

See which code is covered by tests with **:GoCoverage.**

Add or remove tags on struct fields with **:GoAddTags and :GoRemoveTags**.

### Rust

Formats on save

**:RustRun** runs the code

**:RustTest** will run the test that is under the curso

### LaTex

'\ll' compiles the document

'ctl s' recompiles it

### Lisp Family languages

'ee' wil conjure a REPL

### Markdown

Preview markdown with **:MarkdownPreview**

### Emmet

'\<c-y\>,' (ctrl y ,) after typing html:5 generates:

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	_
</body>
</html>
```

The same command when applied to 

```html
div.test
```

will generate 

```html
<div class="test">
</test>
```

### Languages with code completion && syntax highlighting 

 C

 C++

 C#

 Common Lisp

 Clojure

 CSS

 GO

 HTML

 Rust

 Racket

 TypeScript

 Scheme

 Svelte

 LaTex
