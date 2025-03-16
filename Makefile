
copy-hardware:
	cp /etc/nixos/hardware-configuration.nix .

push-config:
	cp -r ./hypr ./waybar ~/.config/