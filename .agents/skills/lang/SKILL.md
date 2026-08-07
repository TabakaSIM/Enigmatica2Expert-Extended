---
name: lang
description: Edit .lang files under resources/. Load when doing i18n, localization changes, or adding translation keys. Do NOT load for non-lang text changes.
---

## Workflow

1. Find the key with grep.
2. Edit the value in place.

## Gotchas

- `%` must be written as `%%`.
- `\n` inside a value is a literal backslash + `n`, never a real line break.
- A new key goes into **every** locale file the pack ships (`en_us`, `ru_ru`, `zh_cn`, …), next to a related key.

## Additional emojis

These Unicode characters render correctly in-game, so try to use them:
```
─│┌┐└┘├┤┬┴┼═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬▀▄█▌▐░▒▓♩♪♫♬♭♮⚀⚁⚂⚃⚄⚅⚐⚑☀☁☂☃☄★☆☈☐☑☒☔⚓⚔⚗⚠⚡⚥✂✉✎✔✘❄❣❤⭐⌘⌚⌛⏏☮☯☜☞☠☹☺
```
