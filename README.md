# justwhitee Dark

A handcrafted VS Code dark theme with petrol/cyan accents, warm readable text, and a full matching terminal palette. Inspired by Gruvbox but more saturated and colorful.

---

## Color palette

| Role | Color | Hex |
|---|---|---|
| Background | near-black teal | `#0e1313` |
| Main text | warm near-white | `#dbd8c6` |
| Control flow (`if` / `for` / `while`) | petrol | `#3a9890` |
| Declarations (`var` / `let` / `fn`) | light petrol | `#56b0a8` |
| Type-def keywords (`class` / `enum`) | petrol | `#3a9890` |
| Import keywords (`import` / `from`) | blue-violet | `#8878d8` |
| Exit / jump (`return` / `raise`) | vivid red | `#dd2d4a` |
| Function names | amber | `#e0b44a` |
| Built-in functions | warm orange italic | `#d4985a` |
| Strings | soft green | `#8acc7c` |
| Template / interpolated strings | aqua-green | `#5cc4a8` |
| Numbers | burnt orange | `#ca6702` |
| Constants / booleans / null | bright yellow | `#e4cc60` |
| Class / type / interface names | rose-magenta | `#c04878` |
| Enum names | amber-gold | `#d4a030` |
| Type parameters `<T>` | pale seafoam | `#94d2bd` |
| Namespace / module names | pale teal | `#8cccc0` |
| Parameters | warm khaki | `#c8b890` |
| Properties / fields | muted aqua-green | `#8ecab8` |
| Decorators / annotations | rose | `#c47888` |
| Comments | muted petrol italic | `#486860` |

---

## Terminal palette (ANSI 16 colors)

| Slot | Name | Hex | Theme role |
|---|---|---|---|
| 0 | Black | `#182424` | dark background |
| 1 | Red | `#cc4848` | errors / return |
| 2 | Green | `#72c85a` | strings / ok |
| 3 | Yellow | `#d4b45a` | functions |
| 4 | Blue | `#3a9890` | keywords / accent |
| 5 | Magenta | `#8878d8` | import keywords |
| 6 | Cyan | `#56b0a8` | declarations |
| 7 | White | `#dbd8c6` | main text |
| 8 | Bright Black | `#324444` | comments |
| 9 | Bright Red | `#e85050` | bright errors |
| 10 | Bright Green | `#8ed870` | bright strings |
| 11 | Bright Yellow | `#e4cc60` | constants |
| 12 | Bright Blue | `#56b0a8` | bright accent |
| 13 | Bright Magenta | `#c898d0` | decorators |
| 14 | Bright Cyan | `#74c4bc` | type params |
| 15 | Bright White | `#ece8d8` | bold text |

---

## Installation

### VS Code (local dev)

```bash
ln -s /path/to/justwhitee-theme ~/.vscode/extensions/justwhitee-theme
```

Restart VS Code → `Ctrl+Shift+P` → **Preferences: Color Theme** → `justwhitee Dark`  
For icons: **Preferences: File Icon Theme** → `justwhitee Icons`

### VS Code (package & install on another machine)

```bash
npm install -g @vscode/vsce
vsce package          # → justwhitee-theme-x.x.x.vsix
```

Install the `.vsix` via **Extensions → Install from VSIX…** or:

```bash
code --install-extension justwhitee-theme-x.x.x.vsix
```

> **Settings Sync note:** Sync uploads your settings (including the theme name) but not local extension files. Install the `.vsix` manually on each machine, or publish to the Marketplace.

### Ptyxis terminal (Ubuntu 24.04+)

```bash
ptyxis --import-palette extras/justwhitee-dark.palette
```

Then restart Ptyxis → right-click → **Preferences** → your profile → **Palette** → select **justwhitee Dark**.

### Windows Terminal

Open Windows Terminal settings (`Ctrl+,` → **Open JSON file**) and add the contents of `extras/windows-terminal-scheme.json` into the `"schemes"` array:

```json
"schemes": [
    { ...existing schemes... },
    { paste contents of windows-terminal-scheme.json here }
]
```

Then set it on your profile:

```json
"colorScheme": "justwhitee Dark"
```

---

## Test the terminal colors

After applying the palette, run the included test script to see all 16 colors, text styles, and a simulated code snippet:

```bash
bash extras/test-colors.sh
```

---

## Publish to VS Code Marketplace

1. Create a publisher at [marketplace.visualstudio.com/manage](https://marketplace.visualstudio.com/manage)
2. Generate a PAT from Azure DevOps (scope: `Marketplace > Manage`)
3. Log in and publish:

```bash
vsce login justwhitee
vsce publish
```

---

## License

MIT
