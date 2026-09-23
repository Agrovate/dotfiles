{
  description = "i3 dotfiles";

  outputs = {self, ...}: {
    config = ./.config/i3/config;
  };
}
