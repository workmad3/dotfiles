# Neovim Configuration Guide

Leader key: `,`

## Plugins

### Telescope (fuzzy finder)

Telescope is the primary way to find and navigate to anything: files, buffers,
text, git objects, help pages. It opens a floating picker window with live
filtering.

**When to use it:** Any time you want to open a file, search for text across a
project, switch buffers, or browse git history.

| Mapping        | Action                                       |
|----------------|----------------------------------------------|
| `,ff`          | Find files by name                           |
| `,fa`          | Find all files (including hidden & ignored)  |
| `,fw`          | Live grep across all files (ripgrep)         |
| `,fb`          | List open buffers                            |
| `,fz`          | Fuzzy search in the current buffer           |
| `,fo`          | Recently opened files                        |
| `,fh`          | Search Neovim help tags                      |
| `,ma`          | Browse marks                                 |
| `,cm`          | Browse git commits                           |
| `,gt`          | Browse git status (changed files)            |

Inside any Telescope picker:
- Type to filter results
- `<CR>` to open the selected item
- `<C-v>` to open in a vertical split
- `<C-x>` to open in a horizontal split
- `<C-t>` to open in a new tab
- `<C-q>` to send all results to the quickfix list (very powerful with `,fw`)

---

### Treesitter (syntax understanding)

Treesitter parses your code into a syntax tree, giving Neovim deep
understanding of your code's structure. This powers accurate syntax
highlighting, indentation, and features in other plugins.

**When to use it:** It works automatically. You don't interact with it
directly, but it improves highlighting, indentation, and code selection
throughout the editor.

**Installed parsers:** Ruby, YAML, Terraform, CSS, HTML, Dockerfile,
gitignore, gitcommit, editorconfig, JSON, JavaScript, SCSS, Lua.

To install additional parsers: `:TSInstall <language>`

---

### nvim-cmp (completion)

nvim-cmp provides a completion popup as you type, pulling suggestions from
multiple sources.

**When to use it:** It activates automatically in insert mode. Start typing and
suggestions appear.

**Completion sources (in priority order):**
1. File paths
2. Copilot AI suggestions (marked with robot icon)
3. LSP symbols (marked with λ)
4. Buffer words (marked with Ω)
5. Snippet expansions (marked with ⋗)

| Mapping          | Action                               |
|------------------|--------------------------------------|
| `<Tab>`          | Next completion item / trigger menu  |
| `<S-Tab>`        | Previous completion item             |
| `<C-n>` / `<Down>` | Next item                         |
| `<C-p>` / `<Up>`   | Previous item                     |
| `<CR>`           | Confirm selected item                |
| `<C-y>`          | Confirm (selects first if none chosen) |
| `<C-e>`          | Dismiss the completion menu          |
| `<C-u>` / `<C-d>` | Scroll documentation up/down       |
| `<C-f>`          | Jump to next snippet placeholder     |
| `<C-b>`          | Jump to previous snippet placeholder |

---

### LSP (Language Server Protocol)

Mason installs and manages language servers. mason-lspconfig wires them into
Neovim. nvim-lspconfig provides the actual LSP client configuration.

**When to use it:** LSP is always active for supported filetypes. It gives you
go-to-definition, references, rename, diagnostics, code actions, and more.

**Installed servers:** ruby_lsp, rubocop, lua_ls, cssls, html, jsonls,
terraformls, ts_ls, yamlls.

| Mapping    | Action                         |
|------------|--------------------------------|
| `gd`       | Go to definition               |
| `gD`       | Go to declaration              |
| `gi`       | Go to implementation           |
| `gr`       | List all references            |
| `go`       | Go to type definition          |
| `gs`       | Show signature help            |
| `K`        | Hover info (docs, types)       |
| `,rn`      | Rename symbol across project   |
| `,ca`      | Run code action (quickfix, refactor) |
| `gl`       | Show diagnostic in float       |
| `[d`       | Jump to previous diagnostic    |
| `]d`       | Jump to next diagnostic        |

To install a new server: `:Mason`, then search and install from the UI.

---

### lsp-format.nvim (format on save)

Automatically formats the current buffer on save using the attached LSP
server's formatting capability.

**When to use it:** It runs automatically every time you save. No mappings
needed. If you want to disable it for a buffer, detach the LSP client or
disable the formatter.

---

### Copilot + CopilotChat (AI assistance)

Copilot provides AI-powered code completions inline, integrated into nvim-cmp.
CopilotChat opens a chat window for longer conversations about your code.

**When to use it:**
- **Copilot completions** appear automatically in the completion menu (robot
  icon). Just tab through suggestions like any other completion source.
- **CopilotChat** is for explaining code, generating tests, asking questions.

| Command                | Action                           |
|------------------------|----------------------------------|
| `:CopilotChat`         | Open chat window                 |
| `:CopilotChatExplain`  | Explain selected code            |
| `:CopilotChatToggle`   | Toggle chat window               |
| `:CopilotChatReset`    | Clear conversation               |
| `:CopilotChatModels`   | Switch AI model                  |

---

### Avante (AI coding assistant)

Avante provides an AI sidebar for code generation, editing, and Q&A. It uses
the "opencode" provider configured in your setup.

**When to use it:** For more complex AI-assisted editing tasks: generating new
code, refactoring selections, asking architectural questions about your
codebase. It renders markdown in a side panel.

Loads lazily -- use `:Avante` commands to interact.

---

### Oil.nvim (file explorer)

Oil opens the parent directory of the current file as an editable buffer. You
rename files by editing their names, delete by removing lines, create by
typing new names. It treats the filesystem like text.

**When to use it:** Browsing directory structure, renaming files, moving files,
creating new files -- all without leaving the editor.

| Mapping    | Action                                  |
|------------|-----------------------------------------|
| `-`        | Open parent directory                   |
| `<CR>`     | Open file/directory                     |
| `-`        | Go up one directory (inside Oil)        |
| `<C-v>`    | Open in vertical split                  |
| `<C-s>`    | Open in horizontal split                |
| `<C-t>`    | Open in new tab                         |
| `<C-p>`    | Preview file                            |
| `g.`       | Toggle hidden files                     |
| `q`        | Close Oil                               |

To save changes (renames, deletes, etc.): `:w` like any buffer.

---

### Lualine (statusline)

Lualine renders a rich statusline at the bottom showing: mode, git branch,
diff stats, diagnostic counts, filename with relative path, encoding,
filetype, cursor position.

**When to use it:** Always visible. Uses the tokyonight theme to match your
colorscheme.

---

### Gitsigns (inline git indicators)

Gitsigns shows added/changed/deleted lines in the sign column (the gutter left
of line numbers). It also provides hunk-level staging, resetting, and inline
blame.

**When to use it:** Whenever you're editing files in a git repo. The signs
appear automatically. Use the hunk commands for surgical git operations without
leaving the editor.

| Mapping      | Action                                |
|--------------|---------------------------------------|
| `]h`         | Jump to next changed hunk             |
| `[h`         | Jump to previous changed hunk         |
| `,hs`        | Stage hunk under cursor               |
| `,hr`        | Reset hunk under cursor               |
| `,hS`        | Stage entire buffer                   |
| `,hu`        | Undo last staged hunk                 |
| `,hR`        | Reset entire buffer                   |
| `,hp`        | Preview hunk diff in float            |
| `,hb`        | Show full blame for current line      |
| `,hd`        | Diff current file                     |
| `,hD`        | Diff current file (cached/staged)     |
| `,tb`        | Toggle inline blame on every line     |
| `,td`        | Toggle showing deleted lines inline   |

Visual mode: `,hs` and `,hr` work on selected line ranges.

---

### Fugitive + Rhubarb (git operations)

Fugitive is a comprehensive git wrapper. Rhubarb adds GitHub integration.

**When to use it:**
- `:Git` opens an interactive git status (stage with `-`, commit with `cc`)
- `:Git blame` for full file blame
- `:Git log` to browse history
- `:GBrowse` opens the current file/selection on GitHub

| Mapping | Action                                        |
|---------|-----------------------------------------------|
| `gh`    | Open current file/selection on GitHub (n + v)  |

---

### mini.surround (surround editing)

Add, delete, or replace surrounding characters (quotes, brackets, tags, etc.)
with a few keystrokes.

**When to use it:** Any time you need to wrap text in quotes/brackets, change
`"string"` to `'string'`, remove surrounding parens, or add HTML tags around
content.

| Mapping   | Action                    | Example                           |
|-----------|---------------------------|-----------------------------------|
| `sa`      | Add surrounding           | `saiw"` → surround word with `"`  |
| `sd`      | Delete surrounding        | `sd"`   → delete surrounding `"`  |
| `sr`      | Replace surrounding       | `sr"'`  → change `"` to `'`      |
| `sf`      | Find surrounding (right)  |                                   |
| `sF`      | Find surrounding (left)   |                                   |
| `sh`      | Highlight surrounding     |                                   |

The `sa` command takes a motion/text-object then the surrounding character:
- `sa3w(` → surround next 3 words with parentheses
- `sat"` → surround inner HTML tag with quotes
- `sa$}` → surround from cursor to end of line with braces

---

### indent-blankline.nvim (indent guides)

Draws vertical lines at each indentation level with scope highlighting, making
it easy to see code structure at a glance.

**When to use it:** Always active. Especially useful in deeply nested code,
YAML files, Ruby blocks, and HTML templates.

---

### toggleterm.nvim (terminal)

A terminal manager that lets you toggle terminals in various layouts without
losing your place.

**When to use it:** Running tests, git commands, or any shell task without
leaving Neovim.

| Mapping     | Action                        |
|-------------|-------------------------------|
| `<C-\>`    | Toggle floating terminal      |
| `,tf`       | Open floating terminal        |
| `,th`       | Open horizontal terminal      |
| `,tv`       | Open vertical terminal        |

Inside the terminal, press `<C-\>` again to hide it (your session persists).
Use `:TermExec cmd="..."` to run a one-off command.

---

### nvim-autopairs (bracket pairing)

Automatically inserts the closing bracket, quote, or paren when you type the
opening one. Handles `<CR>` inside pairs to expand them onto new lines with
proper indentation.

**When to use it:** Always active in insert mode.

---

### Which-Key (keybinding discovery)

Pops up a panel showing available keybindings when you start a key sequence
and pause.

**When to use it:** When you forget a mapping, press `,` and wait -- all
leader mappings appear. Also useful for discovering mappings you haven't
memorised yet.

| Mapping    | Action                      |
|------------|-----------------------------|
| `,wK`      | Show all keymaps            |
| `,wk`      | Search keymaps by prefix    |

---

### Tokyonight (colorscheme)

The active colorscheme, using the "moon" variant. Dark background, soft
pastel syntax colours.

---

## General Keybindings

| Mapping           | Action                        |
|-------------------|-------------------------------|
| `,bn`             | Next buffer                   |
| `,bp`             | Previous buffer               |
| `<C-h/j/k/l>`    | Navigate between splits       |
| `<` / `>` (visual)| Indent/unindent (stays in visual) |
| `<Esc>`           | Clear search highlights       |
| `]q` / `[q`       | Next/previous quickfix item  |

---

## Training Exercises

Work through these exercises in order. Each builds on the previous ones.

### Exercise 1: Motions and Counts

Open any source file. Practice moving without arrow keys.

1. Move down 5 lines: `5j`. Move up 8 lines: `8k`. (Relative line numbers
   in the gutter tell you the count.)
2. Move to the start of the next word: `w`. Move 3 words forward: `3w`.
3. Move to the end of a word: `e`. Move back a word: `b`.
4. Jump to a specific line: `42G` or `:42`.
5. Jump to the top/middle/bottom of the screen: `H` / `M` / `L`.
6. Move to the first non-blank character: `^`. End of line: `$`.
7. Jump to matching bracket: `%`.
8. **Goal:** Navigate a 200-line file using only `j`, `k`, `w`, `b`, `{`, `}`,
   `gg`, `G`, and counts. No arrow keys, no scrolling.

### Exercise 2: Text Objects

Open a file with mixed code. Practice operating on text objects.

1. Place cursor inside a quoted string. Type `ci"` to change the contents.
2. Place cursor inside parentheses. Type `di(` to delete the contents.
3. Place cursor inside a block `{ }`. Type `vi{` to select everything inside.
4. `daw` deletes a word plus the surrounding space. `diw` deletes just the word.
5. `ca'` changes everything inside single quotes, including the quotes.
6. `yit` yanks the contents of an HTML/XML tag.
7. **Goal:** Given `foo("hello world", 42)`, place your cursor on "hello" and
   use one command to: (a) delete the string contents → `di"`, (b) delete the
   entire first argument including quotes → `df,` or `dt,`, (c) select
   everything inside the parens → `vi(`.

### Exercise 3: Surround (mini.surround)

1. Type `hello` on a blank line.
2. With cursor on the word, type `saiw"` → result: `"hello"`.
3. Now type `sr"'` → result: `'hello'`.
4. Now type `sd'` → result: `hello`.
5. Select a line in visual mode (`V`), then type `sa}` → wraps in braces.
6. **Goal:** Convert `name` → `"name"` → `'name'` → `(name)` → `name` using
   only surround commands.

### Exercise 4: Search and Replace

1. Search for a word: `/pattern<CR>`. Jump to next: `n`. Previous: `N`.
2. Search for the word under the cursor: `*` (forward) or `#` (backward).
3. Replace in current line: `:s/old/new/g`.
4. Replace in entire file: `:%s/old/new/g`.
5. Replace with confirmation: `:%s/old/new/gc` (y/n for each match).
6. Press `<Esc>` to clear search highlighting.
7. **Goal:** In a file, rename all instances of `user_name` to `username`
   using `:%s/user_name/username/gc` and confirm each one.

### Exercise 5: Registers and Clipboard

1. Yank a line: `yy`. Paste it below: `p`. Above: `P`.
2. Yank into register `a`: `"ayy`. Paste from register `a`: `"ap`.
3. Delete a line: `dd`. Now paste: `p` -- it pastes the deleted line.
4. Paste the last *yank* (not delete): `"0p`. This is crucial -- `"0` always
   holds your last yank.
5. View all registers: `:reg`.
6. Yank a word into the system clipboard: `"+yiw`. (With the clipboard setting
   in this config, `yy` already goes to system clipboard.)
7. **Goal:** Yank three separate lines into registers `a`, `b`, and `c`,
   then paste them in a different order using `"ap`, `"bp`, `"cp`.

### Exercise 6: Marks

1. Set a mark in the current file: `ma` (mark `a`).
2. Move somewhere else. Jump back: `` `a `` (exact position) or `'a` (line).
3. Set a global mark (works across files): `mA` (uppercase).
4. Open a different file. Jump back: `` `A ``.
5. List all marks: `,ma` (Telescope marks).
6. Built-in special marks: `` `. `` jumps to last edit, `` `" `` jumps to
   position when you last closed the file.
7. **Goal:** Set marks at 3 interesting spots in a file, navigate away, and
   jump back to each one.

### Exercise 7: Macros

1. Record a macro: `qa` (start recording into register `a`).
2. Perform an edit (e.g. go to start of line, add a prefix, go to next line).
3. Stop recording: `q`.
4. Replay the macro: `@a`. Replay it 10 times: `10@a`.
5. **Practical task:** You have 10 lines of `name` that need to become
   `"name",`. Record: `qa0i"<Esc>A",<Esc>jq`. Then run `9@a`.
6. **Goal:** Given a list of plain words (one per line), use a macro to convert
   them into a YAML list (`- word`) or a Ruby array (`["word1", "word2", ...]`).

### Exercise 8: Quickfix Workflow

1. Run `,fw` (live grep) and search for a function name.
2. In the Telescope picker, press `<C-q>` to send all results to quickfix.
3. Navigate results: `]q` (next), `[q` (previous).
4. Make edits at each location as needed.
5. `:copen` shows the full quickfix list. `:cclose` hides it.
6. **Goal:** Find all uses of a function, send to quickfix, then rename the
   function at every call site by stepping through with `]q` and using `.`
   (repeat last change).

### Exercise 9: LSP-Powered Editing

1. Place cursor on a function name. Press `gd` to jump to its definition.
2. Press `<C-o>` to jump back to where you were.
3. Press `gr` to list all references to a symbol.
4. Press `,rn` on a symbol to rename it across the project.
5. Press `,ca` to see available code actions (auto-import, extract, quickfix).
6. Press `K` on any symbol to see its type/documentation.
7. Press `gl` on a line with a warning to see the full diagnostic.
8. **Goal:** In a Ruby or TypeScript file, rename a method with `,rn` and
   verify all references updated with `gr`.

### Exercise 10: Git Workflow (Gitsigns + Fugitive)

1. Edit a file in a git repo. Notice the green `▎` signs for added lines.
2. Jump between changes: `]h` (next hunk), `[h` (previous hunk).
3. Preview a hunk: `,hp` -- see exactly what changed.
4. Stage a single hunk: `,hs`. Undo it: `,hu`.
5. Toggle inline blame: `,tb` -- every line shows who last changed it.
6. Open full git status: `:Git`. Stage files with `-`, commit with `cc`.
7. View a file on GitHub: `gh`.
8. **Goal:** Make changes to 3 separate sections of a file, then use `,hs`
   to stage only 2 of the 3 hunks, and commit with `:Git commit`.

### Exercise 11: File Management with Oil

1. Press `-` to open the parent directory.
2. Navigate into directories with `<CR>`, back up with `-`.
3. Rename a file: edit its name in the buffer, then `:w`.
4. Create a new file: type a new filename on a blank line, then `:w`.
5. Delete a file: delete its line (`dd`), then `:w`.
6. Preview a file without opening: `<C-p>`.
7. **Goal:** Create a new directory by typing `newdir/` at the end of the Oil
   buffer, create a file inside it, then rename it -- all without leaving
   Neovim.

### Exercise 12: Terminal Workflow

1. Open a floating terminal: `<C-\>`.
2. Run a command (e.g. `git log --oneline`).
3. Hide the terminal: `<C-\>` again. Your session persists.
4. Open a horizontal terminal: `,th`. Useful for keeping output visible while
   editing.
5. Run a test from within Neovim: `,tv` for a vertical terminal, then run
   your test command.
6. **Goal:** Open a vertical terminal, run a test suite, fix a failing test
   in the editor split beside it, and re-run without closing the terminal.
