
{ pkgs, lib, config, ... }:

{
  imports = [
    ./programs
    ./settings
    ./desktops
    ./services
    ./system
  ];
}
