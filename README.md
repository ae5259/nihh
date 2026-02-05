# My nihh configs.

There are some things I couldn't figure out to use with Nix so I'm leaving the imperative way of these things.

### Flameshot
Flatpak is required.

Installing flatpak:

```nix
services.flatpak.enable = true;
```

Add the Flathub repository:
```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Install flameshot:
```bash
flatpak install flathub org.flameshot.Flameshot
```

```bash
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
flatpak run --command=flameshot org.flameshot.Flameshot gui
```

## Useful commands I will need later.

```bash
nix profile history --profile /nix/var/nix/profiles/system
```

```bash
sudo nix-collect-garbage --delete-old
```
