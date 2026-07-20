# Keybinds

| Key | Action |
| --- | --- |
| `<C-^>` | Flip to previous (alternate) buffer |
| `<leader>n` | Show mini.notify history |

## Terminal

| Key | Action |
| --- | --- |
| `<C-/>` | Toggle the current terminal |
| `<leader>ft` | Project-root terminal |
| `<leader>fT` | Vim-cwd terminal (distinct from root) |
| `<leader>fl` | Pick from open terminals |
| `<leader>tm` | Move current terminal bottom / right |

`ft`/`fT`/`fl` select the "current" terminal that `<C-/>` toggles. Default is the root terminal.

## Picker (snacks)

| Key | Action |
| --- | --- |
| `<C-f>` / `<C-b>` | Scroll preview down / up |
| `<C-d>` / `<C-u>` | Scroll list down / up |
| `<C-w>` | Cycle focus: input → list → preview |
| `?` | Help (keymap listing) |

## Git (`<leader>gs` / `<leader>gd`)

| Key | Action |
| --- | --- |
| `<Tab>` | Stage / unstage file (`gs`) or hunk (`gd`) |
| `<C-r>` | Discard changes (with confirmation) |
| `<CR>` | Open the file at the change |
| `<C-a>` | Select all (batch stage/discard) |

## Gitsigns (in-buffer hunks)

| Key | Action |
| --- | --- |
| `]h` / `[h` | Next / previous hunk |
| `<leader>ghs` | Stage hunk (visual: selected lines only) |
| `<leader>ghr` | Discard hunk, or selected lines |
| `<leader>ghu` | Undo last stage |
| `<leader>ghS` / `ghR` | Stage / discard whole buffer |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghd` / `ghD` | Diff buffer vs index / vs HEAD |
| `ih` | Hunk text object |

## lazygit (`<leader>gg`)

| Key | Action |
| --- | --- |
| `<leader>gg` | lazygit at project root |
| `<leader>gG` | lazygit at vim's cwd |

In the TUI:

| Key | Action |
| --- | --- |
| `space` | Stage / unstage file or hunk |
| `c` | Commit (message buffer: `:wq` commits, `:q!` cancels) |
| `P` / `p` | Push / pull |
| `]` / `[` | Next / previous tab |
| `?` | Full help |

## Agentic (`<leader>a`)

Global:

| Key | Action |
| --- | --- |
| `<leader>aa` | Toggle chat panel |
| `<leader>an` | New session |
| `<leader>ar` | Restore session |
| `<leader>af` | Add file/selection to context |
| `<leader>ad` | Add current line diagnostics |
| `<leader>aD` | Add all buffer diagnostics |
| `<leader>as` | Stop generation (interrupt) |

In-chat (widget, all buffers):

| Key | Action |
| --- | --- |
| `q` | Close panel |
| `<S-Tab>` | Cycle agent mode (plan / auto-accept / etc.) |
| `\s` | Switch provider (Claude ↔ omp) |
| `\m` | Switch model |
| `\t` | Change thought level |
| `\o` | Open options |

Prompt buffer:

| Key | Action |
| --- | --- |
| `<CR>` / `<C-s>` | Submit prompt |
| `\p` (normal) / `<C-v>` (insert) | Paste image |
| `<Tab>` | Accept completion |

Chat navigation:

| Key | Action |
| --- | --- |
| `]]` / `[[` | Next / previous heading |
| `]t` / `[t` | Next / previous tool call |

Diff preview:

| Key | Action |
| --- | --- |
| `]c` / `[c` | Next / previous hunk |

Permission prompt:

| Key | Action |
| --- | --- |
| `<C-n>` / `<C-p>` | Cycle next / previous |

## Notifications

| Key | Action |
| --- | --- |
| `<leader>un` | Dismiss all mini.notify notifications |

## Formatting

| Key | Action |
| --- | --- |
| `<leader>cf` | Format whole file |
| `<leader>uf` | Toggle autoformat (buffer) |
| `<leader>uF` | Toggle autoformat (global) |
| `<leader>cF` | Format injected languages |
