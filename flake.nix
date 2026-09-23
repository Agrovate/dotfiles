{
  description = "My dotfiles";

  inputs = {
    i3.url = "path:./i3";
  };

  outputs = {
    self,
    i3,
    ...
  }: {
    i3Config = i3.config;
  };
}
