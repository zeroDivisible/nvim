# Keybinds

Shortcuts easy to forget but worth remembering.

| Key | Action |
| --- | --- |
| `<C-^>` | Flip to previous (alternate) buffer |
| `<leader>n` | Show mini.notify history |

## Terminal

| Key | Action |
| --- | --- |
| `<C-/>` | Toggle the current terminal (hide if focused, else show/focus) |
| `<leader>ft` | Switch current terminal to project root (and reveal it) |
| `<leader>fT` | Switch current terminal to vim's cwd (and reveal it) |
| `<leader>fl` | Pick from open terminals; the pick becomes current |
| `<leader>tm` | Move current terminal between bottom and right split |

`<C-/>` toggles whichever terminal was last selected via `ft`/`fT`/`fl`. With none selected, it opens one at the project root.

## Notifications

| Key | Action |
| --- | --- |
| `<leader>un` | Dismiss all mini.notify notifications |

## Formatting

| Key | Action |
| --- | --- |
| `<leader>cf` | Format whole file (works even with autoformat off) |
| `<leader>uf` | Toggle autoformat for current buffer |
| `<leader>uF` | Toggle autoformat globally |
| `<leader>cF` | Format injected languages (code blocks in markdown, etc.) |
