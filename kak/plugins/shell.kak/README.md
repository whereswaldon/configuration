# Shell

[![IRC][IRC Badge]][IRC]

###### [Usage](#usage) | [Documentation](#commands) | [Contributing](CONTRIBUTING)

> [Kakoune] extension to execute shell commands.

## Installation

``` sh
ln --symbolic $PWD/rc $XDG_CONFIG_HOME/kak/autoload/shell
```

## Usage

Add a `:terminal` command:

``` kak
define-command terminal -params .. %{
  shell \
    -export session \
    -export client \
    %sh(echo $TERMINAL) -e %arg(@) \
    %sh(test $# = 0 &&
      echo $SHELL
    )
}
```

Launch a terminal then execute in it:

``` sh
kak -c $KAK_SESSION
```

Kakoune will connect to the session from where `:terminal` was executed.

``` sh
echo "eval -client $KAK_CLIENT <command>" | kak -p $KAK_SESSION
```

The command will be executed in the client from where `:terminal` was executed.

## Commands

- `shell` `[switch]…` `[command]…`: Execute shell command
  - `-export` `<variable>`: Export variable

[Kakoune]: http://kakoune.org
[IRC]: https://webchat.freenode.net?channels=kakoune
[IRC Badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
