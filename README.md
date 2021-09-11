
# Capslock Keybindings

- [Capslock Keybindings](#capslock-keybindings)
  - [About](#about)
  - [Keybindings](#keybindings)
  - [Windows](#windows)
    - [Additional Hotkeys](#additional-hotkeys)
    - [Automatic Startup](#automatic-startup)
  - [Linux](#linux)
    - [Notes](#notes)
      - [Ubuntu](#ubuntu)

## About

This is my preferred custom set of keybindings to make use of the capslock and remap the arrow keys to JKLI and more.

## Keybindings

| Caps +  | Result             |
| ------- | ------------------ |
| J K L I | ← ↓ → ↑            |
| U O     | Home / End         |
| H ;     | Backspace / Delete |
| D F     | PageUp / PageDown  |
| M       | Escape             |

As well as all the combinations with ctrl/shift/alt.

## Windows

The [script](Autohotkey/CapsKeybinds.ahk) is in the *Autohotkey* folder and requires **[Autohotkey](https://www.autohotkey.com)** to run.  
You can also get a compiled exe in the [releases](releases/) section.  
  
### Additional Hotkeys

- `Caps + T`: open/focus cmd.
- `Win + '`: suspend/unsuspend the hotkeys.

### Automatic Startup

To automatically start the script at login, open **Run** (win + r) and write `shell:startup`, then copy a shortcut of the file there.  
  
For the hotkeys to work in an elevated environment, the script has to be ran as administrator.  
  
To do this automatically at startup, either:  
Right-click the exe, go to `Properties > Compatibility > Run this program as admin` and prompt UAC every time, *or* use `taskschd.msc` instead of `shell:startup` like so:

- Open **Run** and write `taskschd.msc`.
- Create task.
- Check "Run with highest privilges".
- In the *Triggers* tab, add a new "At log on" trigger.
- In the *Actions* tab, add a new "Start a program" action and select the script's exe.

## Linux

The [scripts](Autokey/) are in the *Autokey* folder and require **[Autokey](https://github.com/autokey/autokey)** to be installed.  
Place the *CapsKeybinds* folder in `~/.config/autokey/data/` and run Autokey.

### Notes

The scripts use the **hyper** key for the hotkeys. So you have to remap capslock to be used as a hyper key.  
You should be able to find a way by searching this for your distro.  
  
Here is a way to do it in Ubuntu:

#### Ubuntu

- Install the **GNOME Tweak Tool** (GNOME Tweaks)
- "Keyboard & Mouse"
- "Additional Layout Options"
- "Caps Lock behavior"
- "Make Caps Lock an additional Hyper"

A problem that may occur is that `Super + L` is the Lockscreen shortcut, So if Hyper and Super are the same, `Caps + L` will trigger the lockscreen.  
If such is the case, you can either disable the lockscreen shortcut in settings, or try to fix the hyper/super problem.  
  
You can see the keyboard modifier maps by typing `xmodmap` in the terminal.  
The problem is there if hyper and super are both mod4.  
To move hyper to mod3:

- Make this file `~/.xmodmap` with the following content:

```bash
remove mod4 = Hyper_L
add mod3 = Hyper_L
```

- Now we have to type `xmodmap ~/.xmodmap` in the terminal to run these commands. To do this automatically at login:

  - Open *Startup Applications*
  - Add a new item with the following as the command:

```bash
/bin/bash -c "sleep 10 && xmodmap ~/.xmodmap"
```

*For more info, this will add a .desktop file in `~/.config/autostart`*
