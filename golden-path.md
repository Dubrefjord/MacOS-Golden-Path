**# MacOS Golden Path**

## Introduction
This is my setup for a keyboard first workflow in MacOS. I have tried to use stock MacOS settings where ever possible. When the OS has not had support for what I am trying to do, I have introduced free, open source tools, that does not require disabling SIP, to assist. In total, three of those have been installed: 

- Karabiner *-- to change some of the horrible built in key bindings that are unchangeable through the OS alone*
- altTab *-- to change the cmd tab to tab between windows of all apps, instead of between applications. Also, only tab between windows that are in the current space.*
- Hammerspoon *-- to be able to script actions and tie them to a key binding*

If you can live with installing those, you can make use of the keyboard first actions outlined below

## Golden Path

- Use Desktops, not spaces. MacOS does not support jumping to spaces using key bindings.
  - Use `cmd 1..9` to switch between desktops. Stock keybinding that needs to be turned on under settings/keyboard/keyboard shortcuts/mission control.
  - Window tile windows
    - `fn ctrl arrow / f` *-- remap with Karabiner. `cmd shift j/k/l/,`. Create a new complex modification - rule definition in repo.*

- Open applications
  - Use Spotlight

- Move applications between desktops
  - Stock MacOS: Grab the top bar of the application, hit `cmd 1..9` to move to workspace 1..9 *-- Requires mouse :/*
  - Hammerspoon's `hs.spaces.moveWindowToSpace()` does not work, seems to be broken due to a change in the macOS API. Yabai requires disabling SIP. Closed-source solutions exist, but can't be audited and cost money. 
  - Hammerspoon can make mouse movements. Making a script that automates the stock solution above works! The lua script is included in the repo.

- Overview of apps in desktop
  - `F3`, Mission Control

- Tab between apps in a desktop
  - `cmd tab` *-- altTab provides a better tab function, can be locked down to current space.*

- Jump in text
  - Word by word, `option arrow`
  - Start/end of line, `cmd arrow`

- Screenshots
  - `cmd shift e` - for snips, rebound using macOS settings
  - `cmd shift r` - for recordings, rebound using macOS settings
