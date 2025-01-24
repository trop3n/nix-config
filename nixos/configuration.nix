{ config, pkgs, nixvim, home-manager, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/all.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Stylix configuration
  stylix = {
    enable = true;
    image = ./wallhaven-jx2rxw.jpg;
    base16Scheme = {
      base00 = "#1d252c";  # Background
      base01 = "#2a343d";  # Lighter Background
      base02 = "#3a4654";  # Selection Background
      base03 = "#54687a";  # Comments, Invisibles
      base04 = "#6a7a8a";  # Dark Foreground
      base05 = "#a0a8b6";  # Default Foreground
      base06 = "#c0c8d6";  # Light Foreground
      base07 = "#e0e8f6";  # Light Background
      base08 = "#ff5874";  # Red
      base09 = "#ff966c";  # Orange
      base0A = "#ffcc99";  # Yellow
      base0B = "#a8d1a5";  # Green
      base0C = "#9cd1be";  # Cyan
      base0D = "#82aaff";  # Blue
      base0E = "#c792ea";  # Purple
      base0F = "#d6deeb";  # Light Foreground (Alternative)
    };
    homeManagerIntegration.followSystem = true;
    opacity = {
      applications = 0.7;
      terminal = 0.7;
    };
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.karla;
        name = "Karla";
      };
      sansSerif = {
        package = pkgs.karla;
        name = "Karla";
      };
      monospace = {
        package = pkgs.fantasque-sans-mono;
        name = "Fantasque Sans Mono";
      };
    };
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;
  };
  stylix.targets = {
    grub.enable = true;
    nixos-icons.enable = true;
    chromium.enable = true;
    gtk.enable = true;
    fish.enable = true;
  #  nixvim.enable = true;
  };

  # Set the default editor to vim
  environment.variables.EDITOR = "hx";

  fonts.fontDir.enable = true;

  boot.loader = {
  efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 10;
      extraEntries = ''
        menuentry "Arch Linux" {
          set root=(hd3,gpt1)
          linux /vmlinuz-linux root=UUID=59f9c4f1-16a0-4877-8c6b-23e2e504d4e3 rw
          initrd /initramfs-linux.img
        }
     '';
    };
  };

  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;
 
  # libvirt
  virtualisation.libvirtd = {
    enable = true;
    qemu = { 
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ pkgs.OVMF.fd ];
      };
    };
  };

  # System time
  time.hardwareClockInLocalTime = true;
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
#   services.xserver.displayManager.setupCommands = ''
#       xrandr --output HDMI-1 --primary --auto --output DP-1 --right-of HDMI-1
#   '';

    # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    settings = {
      Theme = {
        Background = "/home/jason/Pictures/wallpapers/wallhaven-e7djlk.png";
      };
    };
  };
  services.desktopManager.plasma6.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;

    # prime activation
    # prime = {
    #   sync.enable = true;
    #   nvidiaBusId = "PCI:1:0:0";
    # };

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if your have graphical corruption issues or application crashes after
    # waking up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the Nvida open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver)/
    # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via 'nvidia-settings'.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    # driSupport = true;
    # driSupport32bit = true;
  };

  # steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # /etc/hosts replacement
  # networking.extraHosts = ''
  # ''

  # networking.bridges.br0.interfaces = [ "enp6s0" ];
  # networking.interfaces.br0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;
  # Open ports in the firewall.
  networking.firewall.trustedInterfaces = [ "vibr0" ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Create default network via systemd service
  systemd.services.libvirt-default-network = let
    networkXml = pkgs.writeText "default-network.xml" ''
      <network>
        <name>default</name>
        <forward mode='nat'/>
        <bridge name='virbr0' stp='on' delay='0'/>
        <ip address='192.168.122.1' netmask='255.255.255.0'>
          <dhcp>
            <range start='192.168.122.2' end='192.168.122.254'/>
          </dhcp>
        </ip>
      </network>
    '';
  in {
    wantedBy = [ "multi-user.target" ];
    after = [ "libvirtd.service" ];
    requires = [ "libvirtd.service" ];
    path = [ pkgs.libvirt ];
    script = ''
      # Create network if it doesn't exist
      if ! virsh net-info default >/dev/null 2>&1; then
        virsh net-define ${networkXml}
      fi
      
      # Ensure autostart and activation
      virsh net-autostart default || true
      virsh net-start default || true
    '';
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
  #  alsa.support32bit = true;
    pulse.enable = true;
  };

  users.users.jason = {
    isNormalUser = true;
    description = "jason";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "kvm" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  environment.systemPackages = with pkgs; [
    # adwaita-icon-theme
    # wireshark
    # efibootmgr
    # os-prober
    # vscodium
    # postgresql_17
    # metasploit
    # qemu
    # virt-manager
    # libvirt
    # virt-viewer
    # bridge-utils
    # dnsmasq
    # ebtables
    # iptables
    # OVMF.fd
  ];

  services.openssh.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}