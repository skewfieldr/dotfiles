# Dotfiles by skewfieldr

This repo is for learning to build neovim dotfiles from scratch.

## Cheat sheet

### Command
- ```:w```: save/write file
- ```:q```: close file (should be saved)
- ```:q!```: force close file
- ```:wq!```: save and force close file
- ```:wqa!```: save and force close all files
- ```:e```: edit file or create new file that does not exist

### Basic keymaps to get started...
#### Basic mode
- ```Esc```: to go to Normal mode
    - Press this button when you are not sure...
- ```a```: go to insert mode, cursor go in front of the current char
- ```i```: go to insert mode, cursor go in the back of the current char
- ```v```: go to Visual mode, for blocking text

#### Basic movement
- ```w```: move cursor by 1 word
    - ```2w```: move cursor by 2 word
- ```e```: go to end of the word
- ```b```: go back to the beginning of the word

#### Basic text manipulation
- ```s```: delete current character and go to INSERT mode
- ```c```: change, example below
    - ```cw``` -> change 1 word
    - ```c2w``` -> change 2 word
    - ```ciw``` -> change inside word
    - ```ci(``` -> change all inside ```()```
- ```d```: delete, example below
    - ```dw``` -> delete 1 word
    - ```d2w``` -> delete 2 word
    - ```diw``` -> delete inside word
    - ```di(``` -> delete all inside ```()```
    - ```dd``` -> delete 1 full row
    - ```d2d``` -> delete 2 full rows
    - ```d10d``` -> delete 10 full rows
    - ```dj``` -> delete current row and 1 row below
    - ```d2j``` -> delete current row and 2 row below
    - ```dk``` -> delete current row and 1 row above
    - ```d2k``` -> delete current row and 2 row above
- ```u```: undo
- ```Ctrl + r```: redo
- ```g```: go to line
    - ```gg```: go to the first line
    - ```GG```: go to the last line
    - ```g10g```: go to the 10th line
    - ```g10j```: move 10 line down
    - ```g10k```: move 10 line up
- ```Ctrl + u```: scroll up
- ```Ctrl + d```: scroll down
- ```Space```: Leader key

#### Commenting
Base keymap: ```gc```
- ```gcc```: Comment current line
- ```gc1j```: Comment current line and 1 line below
- ```gc1k```: Comment current line and 1 line above

Works in ```Visual``` mode
- Press ```v``` to go to ``Visual```` mode, block the text, press ```gc```


### Keymaps for exploring files and directories
- ```Space + e```: toggle nvim-tree / directory
- ```Ctrl + w + h```: move to the buffer in the left (usually nvim-tree is on the left buffer)
- ```Ctrl + w + l```: move to the buffer in the right (usually text file is on the right buffer)

#### Telescope
- Click ```Space```, wait for a few seconds, there will be a list of keymap with dscriptions
- ```Space + Space```: Search open files
- ```Space + s```: Search... 
- ```Space + s + f```: Search files in directory
- ```Space + s + k```: Search keymaps
- ```Ctrl + n```: move down in drop down (n = next)
- ```Ctrl + p```: move up in drop down (p = previous)
- ```Ctrl + y```: select item (like ```Enter```)

