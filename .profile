# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## RAISA: AUTOSTART SWAY
if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$XDG_VTNR" -eq "1" ]]; then
    # Disable hardware cursor
    # Needed when booting from virtualized environment (VM)
    export WLR_NO_HARDWARE_CURSORS=1

    # Allow software rendering when needed
    # export WLR_RENDERER_ALLOW_SOFTWARE=1

    exec dbus-run-session sway -d > ~/sway-debug.log 2>&1
fi
