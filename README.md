# ledger.kak

An extremely crude implementation of ledgerfile account name autocompletion for the [kakoune](https://kakoune.org)
editor. If your ledger file has the `.ledger` suffix, you should be fine.

## Installation

```bash
git clone https://github.com/whereswaldon/ledger.kak
ln -sv $PWD/kakdown/ledger.kak ~/.config/kak/autoload/
```

**Note:** If this is your first time installing a Kakoune plugin and you don't already
have a `~/.config/kak/autoload/` folder, I recommend following these steps to create
it:

```bash
mkdir -p ~/.config/kak/autoload/
ln -sv $(dirname $(which kak))/../share/kak/autoload ~/.config/kak/autoload/system
```

If you don't symlink the system-wide `autoload` folder, all of the default Kakoune
commands will not be available next time you start your editor.

## Commands

`ledger-complete` generates new completions for the current buffer.

## Configuration

Currently, nothing in this project needs configuration. Completions are generated
automatically if the file extension is `.ledger`.

## Todo

- [ ] Make the completion {en,dis}ableable.

## Contribute

Feature requests and pull requests welcome!

## License

Unlicense

