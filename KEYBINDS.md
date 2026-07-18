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
| `<leader>ft` | Reveal/select the project-root terminal (creates one if none) |
| `<leader>fT` | Reveal/select the vim-cwd terminal (distinct from root; creates one if none) |
| `<leader>fl` | Pick from open terminals; the pick becomes current |
| `<leader>tm` | Move current terminal between bottom and right split |

`<C-/>` toggles whichever terminal was last selected via `ft`/`fT`/`fl`. With none selected, it opens the project-root terminal. `ft` and `fT` target separate terminals (kept apart even when cwd == root), so you can have a root shell and a cwd shell open at once.

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
