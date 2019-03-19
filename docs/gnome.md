# GDM: System Administrator Guide
https://help.gnome.org/admin/system-admin-guide/stable/index.html.en

# GDM: Disable Sleep
`$ sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'`

`$ sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'`

# GDM: Disable User List
`$ sudo -u gdm dbus-launch gsettings set org.gnome.login-screen disable-user-list true`
