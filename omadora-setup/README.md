# Info

## hypr

1. In `bindings.lua` you can find custom keybindings.
2. In `looknfeel` you can find the option for disabling window opacity.

## omarchy

1. Under `omarchy/themes` you can find your own theme (incomplete)
2. Don't copy the whole directory only themes, this directory is here for reference for later on

## theme neovim - symlink omarchy's neovim.lua

```bash
ln -sf ~/.local/state/omarchy/current/theme/neovim.lua \
~/.config/nvim/lua/plugins/theme.lua
```

Delete your own theme if you copied from dotfiles.

## Wifi problems

In case you have to connect to wifi using nmcli:

### Enable Wifi

```bash
nmcli radio wifi on
```

### Scan for Available Networks

```bash
nmcli device wifi list
```

### Connect to wifi network

```bash
nmcli device wifi connect "SSID_or_BSSID" password "your_password"
```

#### Interactively

```bash
nmcli device wifi connect "SSID_or_BSSID" --ask
```

### Connect to an Already Configured Network

```bash
nmcli connection up "SSID_or_connection_name"
```

### Deactivate 5Ghz wifi in case it keeps disconnecting

```bash
nmcli connection modify "<connection_name>" 802-11-wireless.band bg
```

```bash
nmcli connection down "<connection_name>" && nmcli connection up "<connection_name>"
```
