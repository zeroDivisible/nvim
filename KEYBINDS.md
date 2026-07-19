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

`<C-/>` toggles whichever terminal was last selected via `ft`/`fT`/`fl`. With none selected, it opens the project-root terminal. `ft` and `fT` stay distinct even when cwd == root.

## Picker (snacks)

| Key | Action |
| --- | --- |
| `<C-f>` | Scroll preview down |
| `<C-b>` | Scroll preview up |
| `<C-d>` | Scroll list down |
| `<C-u>` | Scroll list up |
| `<C-w>` | Cycle focus between input, list, and preview |
| `?` | Toggle help (keymap listing) |

`<C-f>`/`<C-b>` scroll the preview from either the input line or the list window. `<C-d>`/`<C-u>` scroll the list, not the preview.

## Git status (`<leader>gs`) and diff (`<leader>gd`)

| Key | Action |
| --- | --- |
| `<Tab>` | Stage/unstage the selected file or hunk (`git add` / `git restore --staged`) |
| `<C-r>` | Discard working-tree changes (`git restore`), with confirmation |
| `<CR>` | Open the file at the change |
| `<C-a>` | Select all items (for batch stage/discard) |

`<Tab>` toggles direction: unstaged files get staged, staged files get unstaged. In the diff view (`<leader>gd`) it stages the selected hunk. Committing still happens outside the picker.

## Gitsigns (in-buffer hunks)

| Key | Action |
| --- | --- |
| `]h` / `[h` | Next / previous hunk |
| `]H` / `[H` | Last / first hunk |
| `<leader>ghs` | Stage hunk (visual mode: stage only the selected lines) |
| `<leader>ghr` | Reset (discard) hunk, or selected lines |
| `<leader>ghu` | Undo last stage |
| `<leader>ghS` | Stage whole buffer |
| `<leader>ghR` | Reset whole buffer |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghd` | Diff this buffer vs index |
| `<leader>ghD` | Diff this buffer vs HEAD |
| `ih` | Select hunk (operator-pending / visual) |

## Staging workflow

Three granularities, pick by scope:

1. **Whole files** — `<leader>gs`, `<Tab>` on each file (or `<C-a>` then `<Tab>` for all). `<Tab>` again to unstage. `<C-r>` to discard.
2. **Whole hunks** — in the buffer, `]h` to the hunk, `<leader>ghs`. `<leader>ghu` to undo the last stage. In `<leader>gd`, `<Tab>` stages the selected hunk.
3. **Part of a hunk** — in the buffer, select the lines in visual mode, `<leader>ghs`. Stages only that range.

## lazygit (`<leader>gg`)

| Key | Action |
| --- | --- |
| `<leader>gg` | Open lazygit at the project root (floating terminal) |
| `<leader>gG` | Open lazygit at vim's cwd |

Inside lazygit (the TUI):

| Key | Action |
| --- | --- |
| `space` | Stage / unstage the selected file or hunk |
| `c` | Commit staged changes (opens a message buffer in nvim) |
| `P` | Push |
| `p` | Pull |
| `b` | Branches |
| `s` | Stash |
| `]` / `[` | Next / previous tab (status/files/branches/commits/stash) |
| `?` | Full keymap help |

Commit message buffer: `:wq` commits, `:q!` cancels. lazygit uses `$EDITOR`, which `~/.zprofile` sets to `nvim`.

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
