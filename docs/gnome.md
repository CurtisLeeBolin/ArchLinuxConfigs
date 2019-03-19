# GDM: Disable Sleep
`$ sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'`

`$ sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'`

# GDM: Disable User List
`$ sudo -u gdm dbus-launch gsettings set org.gnome.login-screen disable-user-list true`
