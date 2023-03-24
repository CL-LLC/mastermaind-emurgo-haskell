# EMURGO Academy Haskell Course: Solo Project (Welcome to Mastermind!)

Mastermind: A code-breaking game where one player creates a secret code using 4 colors (these can be repeated) , and the other player attempts to guess the code through a process of deduction. The code-maker provides feedback on each guess, indicating the number of that are the correct color and in the correct position, as well as the number of that are the correct color but in the wrong position.

This repository contains a preconfigured Haskell development environment, allowing you to start coding in Haskell with zero installation using [Gitpod](https://www.gitpod.io/) and a browser-based version of VS Code.

The environment contains a skeleton for a simple Haskell project, designed as a starter for the solo project of EMURGO Academy's Haskell course.

## Create Your Environment

1. Fork this repository
2. Copy the link to your new repository and prefix it with "https://gitpod.io/#" in your browser
3. Click `Continue with GitHub` and `Authorize gitpod-io`
4. Wait for the environment to build. This can take a while the first time.
5. Select "VS Code Browser" as your editor.

## Build Your Project

This template contains a basic structure for a simple Haskell project. Add your project code to the empty `*.hs` files:

* `scr-exe/Main.hs`: to run your application (this is what will be used if you )

Add any additional packages you need for your project below `base` in the `build-depends` section of `mastermind.cabal`. Follow instructions if you encounter any errors due to a "hidden package": these refer to packages that are part of the standard library but aren't imported into a Haskell project by default. The editor tooling will identify the name of the package you need to add to `build-depends` in such cases.

Use `cabal build` in the terminal to build your code.

Use `cabal run` to run your completed program.
