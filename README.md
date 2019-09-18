# Emacs Config

I like to keep my Emacs _very_ minimal and only leverage features built into Emacs.

## Tips to use Emacs without 3rd party packages

### 1. Follow Emacs tutorial to learn the basics

Once you open Emacs, Press Ctrl-h then t and you should begin the tutorial.  This will teach you quite a bit about using Emacs.

### 2. Use Dired to find files

Open a folder in Dired using C-x d.  This will allow you to search for a file to edit.

Pro tip: If you use C-u C-x d, you can change the directory listing switches.  If you add "R" at the end, it'll recursively show you your directory.  I use this all the time so that I can simply use C-s to search for the file I need.

### 3. For better JSX support, build latest Emacs from source

Emacs 27 has much better JSX indent and highlighting support.