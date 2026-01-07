# My nihh configs.

There are some things I couldn't figure out to use with Nix so I'm leaving the imperative way of these things.

### Flameshot
Flatpak is required.

```bash
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
flatpak run --command=flameshot org.flameshot.Flameshot gui
```