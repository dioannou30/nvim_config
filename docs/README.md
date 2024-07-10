# Basic Vim Motions and Commands for VS Code Users

## Navigation

### Movement
- `h`: Move left
- `l`: Move right
- `j`: Move down
- `k`: Move up
### Horizontal Movement
- `w`: Move to the beginning of the next word
- `b`: Move to the beginning of the previous word
- `e`: Move to the end of the current/next word
- `0`: Move to the beginning of the line
- `$`: Move to the end of the line
- `f{char}`: Move to the next occurrence of {char} on the current line
- `F{char}`: Move to the previous occurrence of {char} on the current line
### Vertical Movement
- `gg`: Move to the first line of the document
- `G`: Move to the last line of the document
- `{number}G`: Move to line {number}
- `Ctrl+u`: Move up half a screen
- `Ctrl+d`: Move down half a screen
## Editing
### Deleting
- `x`: Delete character under cursor
- `dw`: Delete word
- `dd`: Delete entire line
- `d$` or `D`: Delete from cursor to end of line
- `di(`: Delete everything inside parentheses
- `di"`: Delete everything inside double quotes
- `di'`: Delete everything inside single quotes
- `dib`: Delete everything inside parentheses (alternative)
- `diB`: Delete everything inside curly braces
### Changing (Delete and enter Insert mode)
- `cw`: Change word
- `cc`: Change entire line
- `ci(`: Change everything inside parentheses
- `ci"`: Change everything inside double quotes
### Yanking (Copying)
- `yw`: Yank word
- `yy`: Yank entire line
- `yi(`: Yank everything inside parentheses
- `yi"`: Yank everything inside double quotes
### Pasting
- `p`: Paste after cursor
- `P`: Paste before cursor
### Undo and Redo
- `u`: Undo
- `Ctrl+r`: Redo
## Useful Combinations
- `ciw`: Change inside word
- `diw`: Delete inside word
- `yiw`: Yank inside word
- `ct{char}`: Change until {char}
- `dt{char}`: Delete until {char}
## Code Actions and Navigation
### Code Actions
- `<space>ca`: Open code action menu (similar to VS Code's right-click menu)
- `<space>qf`: Open quickfix menu for additional actions

### Indentation
- `>>`: Indent current line
- `<<`: Unindent current line
- `==` : Auto-indent current line

### Go To Definition and Implementation
- `gd`: Go to definition
- `gi`: Go to implementation
- `gr`: Go to references

## Searching and Highlighting
### Search for Word Under Cursor
- `*`: Search forward for the word under the cursor
- `#`: Search backward for the word under the cursor
### Search in Current File
- `/`: Start forward search (type your search term and press Enter)
- `?`: Start backward search
### Navigate through search results
- `n`: Go to next occurrence
- `N`: Go to previous occurrence
