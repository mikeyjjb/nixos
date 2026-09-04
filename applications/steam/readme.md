programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; // Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; // Open ports in the firewall for Source Dedicated Server
};

PROTON_NO_ESYNC=1 PROTON_NO_FSYNC=1 %command%

# Force the launcher to float natively
windowrulev2 = float, class:^(eve-online-launcher)$
windowrulev2 = center, class:^(eve-online-launcher)$

# Keep the actual game client pristine
windowrulev2 = tile, class:^(eve)$
windowrulev2 = forceinput, class:^(eve)$

programs.gamescope.enable = true;

gamescope -W 1920 -H 1080 -f -- %command%


Running EVE Online on NixOS while using a Tiling Window Manager (TWM) like Hyprland, Sway, or i3 is an incredibly powerful setup, especially for multi-boxing. However, it requires a few specific configurations to prevent the tiling environment from breaking the game clients or launchers. [1] (/goto?url=CAESiwEB6zswFR55JML4sKJ9a_qNfOr7Iy3V8IlOjZDqPHwA_wM9N0KesOLP3dn1HvlaygBkp3gw2KRQu0tysJ1cMpYrnqT4JUu3ImXK81NhQbRq8T6dNBTqQoWg6XVfsy6E8gFvXEdYATkL3D43yUjCuhdIxzx9OEdmiUx_k8mBtf4J-0xVBIopgXuZcRHk), [2] (/goto?url=CAESoAEB6zswFSyOUFb0l_lk1h2GlK1sPUlZmjJAJXAMY8jj4aVPOXhfwF2joSNkKzEd89V2ixpgUtntxd_QYtjN7HTm0i9wM0kfkhZXrnL4COBRlFUkBZdWW1KHfIfdhamMV7R0jzARROiB5wldGLDSQZPcwP0RJRDxMBA1xUIvS7OEtaCz6TRJSvKW-ONBvBgG6E_CdmCdQPmblZZRLkrYEvjD), [3] (/goto?url=CAESkgEB6zswFRXJYhY0RNh55APztF9SWZwODDZs-tRPr6bwRZhZyPGrSw6BnbRNxn_Y-KMy-Xv2MRuiqdjDFX5cVIhTL3Br9wnQY7pNXWYevN0j7e54N3VDu3xBcTN2eZG-WV30aoN1pTUYJ6wQY7S_HZYWSwtHMstn67Qbm96ggFHAeEXq59ieH8ii8j8G0SAkU4_XPA)1. Installing EVE Online on NixOSThe most reliable way to run EVE Online on NixOS is through Steam with Proton, rather than a standalone Lutris script, because Steam natively handles the complex sandbox and library requirements of NixOS. [1] (/goto?url=CAESkgEB6zswFe99gDNnrciw-UX1aMZoLv7-5Njg0za7iAwd9ZRgc353ZVJPImLmt_08Qry5tMPeyucG6MirhR8jMWWCmO-Y8sI_dwZ1F8RGNcIQTMdH5ZOFj41BvCvGNTk7zDszNy8JjoOSs_RMvoHf7oQZgCdsoy65ZDqR-hTF6Td53ed1UJgc0hc4Sp0YIJ-k4c98eg), [2] (/goto?url=CAESbQHrOzAVgvgLq4KGnlnSrSr1hIVfgpmsmEgg5hbQ9-7tn8HOQTrFuAradXD4K8yiMEBJs_W7wvbTwhW-S_NGNHOrd5MLIMs7ufU2kDKQ0WdS7qvpMj6yGREWtxfXFUXTNL2tT3mROdLul0gdhaA)Add Steam to your configuration.nix: [1] (/goto?url=CAESkgEB6zswFe99gDNnrciw-UX1aMZoLv7-5Njg0za7iAwd9ZRgc353ZVJPImLmt_08Qry5tMPeyucG6MirhR8jMWWCmO-Y8sI_dwZ1F8RGNcIQTMdH5ZOFj41BvCvGNTk7zDszNy8JjoOSs_RMvoHf7oQZgCdsoy65ZDqR-hTF6Td53ed1UJgc0hc4Sp0YIJ-k4c98eg)nixprograms.steam = {
  enable = true;
  remotePlay.openFirewall = true; // Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; // Open ports in the firewall for Source Dedicated Server
};
Use code with caution.Important Launcher Fix:Once installed via Steam, go to EVE Online's Properties > General and paste the following into the Launch Options to prevent performance stuttering and Electron sandbox crashes: [1] (/goto?url=CAESbQHrOzAVgvgLq4KGnlnSrSr1hIVfgpmsmEgg5hbQ9-7tn8HOQTrFuAradXD4K8yiMEBJs_W7wvbTwhW-S_NGNHOrd5MLIMs7ufU2kDKQ0WdS7qvpMj6yGREWtxfXFUXTNL2tT3mROdLul0gdhaA)bashPROTON_NO_ESYNC=1 PROTON_NO_FSYNC=1 %command%
Use code with caution.(In the EVE Launcher settings gear, it is also recommended to turn off "Hardware Acceleration" if the launcher displays as a black window). [1] (/goto?url=CAESbQHrOzAVgvgLq4KGnlnSrSr1hIVfgpmsmEgg5hbQ9-7tn8HOQTrFuAradXD4K8yiMEBJs_W7wvbTwhW-S_NGNHOrd5MLIMs7ufU2kDKQ0WdS7qvpMj6yGREWtxfXFUXTNL2tT3mROdLul0gdhaA)2. Tiling WM Rules for EVE OnlineBy default, a tiling WM will try to stretch the EVE Online Launcher and the game client into rigid grid boxes. This breaks the UI. You must force them to float or capture them in borderless fullscreen modes. [1] (/goto?url=CAESkgEB6zswFRXJYhY0RNh55APztF9SWZwODDZs-tRPr6bwRZhZyPGrSw6BnbRNxn_Y-KMy-Xv2MRuiqdjDFX5cVIhTL3Br9wnQY7pNXWYevN0j7e54N3VDu3xBcTN2eZG-WV30aoN1pTUYJ6wQY7S_HZYWSwtHMstn67Qbm96ggFHAeEXq59ieH8ii8j8G0SAkU4_XPA), [2] (/goto?url=CAESoAEB6zswFSyOUFb0l_lk1h2GlK1sPUlZmjJAJXAMY8jj4aVPOXhfwF2joSNkKzEd89V2ixpgUtntxd_QYtjN7HTm0i9wM0kfkhZXrnL4COBRlFUkBZdWW1KHfIfdhamMV7R0jzARROiB5wldGLDSQZPcwP0RJRDxMBA1xUIvS7OEtaCz6TRJSvKW-ONBvBgG6E_CdmCdQPmblZZRLkrYEvjD)For Hyprland (hyprland.conf)ini# Force the launcher to float natively
windowrulev2 = float, class:^(eve-online-launcher)$
windowrulev2 = center, class:^(eve-online-launcher)$

# Keep the actual game client pristine
windowrulev2 = tile, class:^(eve)$
windowrulev2 = forceinput, class:^(eve)$
Use code with caution.For Sway / i3 (config)i3config# Make launcher float
for_window [class="eve-online-launcher"] floating enable

# Set the game client to toggle fullscreen gracefully
for_window [class="eve"] border none
Use code with caution.3. Essential Tools for EVE + TWM UsersGamescope (Highly Recommended):Tiling window managers can sometimes mess up mouse constraints (e.g., when you try to spin your camera and your mouse leaves the screen). Wrapping EVE inside Valve’s gamescope forces the game to think it's running in an isolated desktop.Enable it in your NixOS config:nixprograms.gamescope.enable = true;
Use code with caution.Then change your Steam launch options for EVE to: gamescope -W 1920 -H 1080 -f -- %command% (adjust to your resolution). [1] (/goto?url=CAESoAEB6zswFSyOUFb0l_lk1h2GlK1sPUlZmjJAJXAMY8jj4aVPOXhfwF2joSNkKzEd89V2ixpgUtntxd_QYtjN7HTm0i9wM0kfkhZXrnL4COBRlFUkBZdWW1KHfIfdhamMV7R0jzARROiB5wldGLDSQZPcwP0RJRDxMBA1xUIvS7OEtaCz6TRJSvKW-ONBvBgG6E_CdmCdQPmblZZRLkrYEvjD)EVE-O Preview (Multi-boxing):If you fly multiple accounts, you can run the classic EVE-O Preview tool using Wine inside the same Steam Proton prefix to get live miniature thumbnail previews of your other clients. [1] (/goto?url=CAESiwEB6zswFR55JML4sKJ9a_qNfOr7Iy3V8IlOjZDqPHwA_wM9N0KesOLP3dn1HvlaygBkp3gw2KRQu0tysJ1cMpYrnqT4JUu3ImXK81NhQbRq8T6dNBTqQoWg6XVfsy6E8gFvXEdYATkL3D43yUjCuhdIxzx9OEdmiUx_k8mBtf4J-0xVBIopgXuZcRHk)If you encounter any specific issues, let me know:Which tiling window manager are you using? (Hyprland, Sway, i3, etc.)Are you planning to multi-box multiple game clients?Are you experiencing any specific bugs, like a black launcher screen or mouse-trapping issues?

