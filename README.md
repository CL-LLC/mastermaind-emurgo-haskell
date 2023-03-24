# EMURGO Academy Haskell Course: Solo Project (Welcome to Mastermind!)

![mastermind](https://user-images.githubusercontent.com/75137920/227632992-cfbc9d7c-ddf2-4402-88db-a8321250727b.png)

Mastermind: A code-breaking game where one player creates a secret code using 4 colors (these can be repeated) , and the other player attempts to guess the code through a process of deduction. The code-maker provides feedback on each guess, indicating the number of that are the correct color and in the correct position, as well as the number of that are the correct color but in the wrong position.

This repository contains a preconfigured Haskell development environment, allowing you to start coding in Haskell with zero installation using [Gitpod](https://www.gitpod.io/) and a browser-based version of VS Code.

## Create Your Environment and Play

1. Fork this repository
2. Copy the link to your new repository and prefix it with "https://gitpod.io/#" in your browser
3. Click `Continue with GitHub` and `Authorize gitpod-io`
4. Wait for the environment to build. This can take a while the first time.
5. Click on More Actions...
6. Select "Open in Browser" as your editor.
7. In the terminal use cabal run command and play. _(if you are in the ghci prelude you have to use the :q command)_

## Principal terms in the game

1. exactMatches: This represents the number of colors in the player's guess that match both the color and the position of the colors in the secret code. In other words, these are the completely correct color choices in the player's guess. For example, if the secret code is [Red, Green, Blue, Yellow] and the player's guess is [Red, Blue, Green, Yellow], then there are 2 exact matches: Red and Yellow, as they are both in the correct position in the guess.
2. colorMatches: This represents the number of colors in the player's guess that are present in the secret code but are not in the correct position. This is calculated by counting the occurrences of each color in both the secret code and the player's guess, taking the minimum of those counts, and subtracting the exact matches. Using the same example as before, where the secret code is [Red, Green, Blue, Yellow] and the player's guess is [Red, Blue, Green, Yellow], there are 2 color matches: Blue and Green, as they are both present in the secret code but in the wrong position in the guess.
3. These two values together provide feedback to the player about how close their guess is to the secret code, and they can use this information to refine their future guesses.

### How to change the difficulty?

- Go to the scr-exe folder
- Open the Main.hs file
- Go to 74 line and modify the number between 1 to 6 _(default 4) (1=very easy, 2=easy, 3=normal, 4=hard, 5=very hard and 6=expert)_
- If you want to add more difficulty go to 75 line and modify the number for a smaller one _(default 20)_

**_Note: We are working to improve the game_**

### How to Play Mastermind (wikihow example)

Mastermind is a difficult puzzle game, in which one player tries to guess the code their opponent comes up with. Originally a board game, though with roots in earlier pen-and-paper games, Mastermind is now widely available online and for mobile devices as well.

You can also play Mastermind with paper and pen if you don't have the board game or video game version.

[Playing Mastermind](https://www.wikihow.com/Play-Mastermind)

