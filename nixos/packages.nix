{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

    # ====== ARCHIVES ======== #
    zip
    xz
    unzip
    p7zip
    gnutar

    # ======== UTILS ========= #
    fastfetch
    nnn
    git
    git-crypt
    libgcc
    clang
    gdb
    lldb
    ripgrep
    jq
    fq
    yq-go
    eza
    fzf
    httpie
    mkcert
    gh
    just
    killall
    tmux
    zellij
    coreutils
    du-dust
    fd
    broot
    direnv
    mosh
    procs
    sl
    rustcat
    doggo
    dig
    rclone
    tree
    fx
    zoxide
    lsd
    lazygit
    lf
    superfile
    navi
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
    ags
    efibootmgr
    os-prober
    bat
    duplicati
    wine64
    television
    pik 
    gitnr
    sampler
    tealdeer

    # === NETWORKING TOOLS === #
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    ipcalc
    termshark
    wget
    curl
    rustscan
    openvpn
    inetutils
    tailscale

    # ========= MISC ========= #
    cowsay
    file
    which
    gnused
    gawk
    zstd
    gnupg
    lolcat
    cgdb
    cava
    figlet
    astroterm

    # ===== NIX RELATED ====== #
    nix-output-monitor
    nix-prefetch-github

    # ===== PRODUCTIVITY ===== #
    hugo
    glow
    obsidian
    fabric-ai
    ollama
    pinokio
    siyuan
    vivaldi
    anki
    xournalpp
    zathura
    glance
    mermaid-cli

    # ====== MONITORING ====== #
    btop
    iotop
    iftop

    # == SYSCALL MONITORING == #
    strace
    ltrace
    lsof

    # ======== GAMING ======== #
    mangohud
    protonup
    discord
    lutris
    piper
    solaar
    torzu
    ryujinx
    simple64
    desmume
    libratbag

    # ======= GAME DEV ======= #
    unityhub
    pixelorama
    godot_4

    # ======== DESIGN ======== #
    krita
    blender
    fontforge

    # ===== AUDIO & VIDEO ==== #
    ffmpeg_7-full
    supercollider
    puredata
    bitwig-studio
    faust
    sonic-pi
    processing
    vlc
    obs-studio
    pamixer
    feh
    flameshot
    cables
    gowall
#    natron

    # ======= BROWSERS ======= #
    firefox-devedition
    brave
    tor
    tor-browser
    chromium
    google-chrome

    # ==== SECURITY TOOLS ==== #
    social-engineer-toolkit
    ffuf
    wordlists
    ropgadget
    netcat-openbsd
    wireshark
    burpsuite
    zap
    ghidra-bin
    nmap
    tshark
    volatility3
    elasticsearch
    imhex
    hashcat
    metasploit
    rizin
    powersploit
    maltego
    sqlmap
    postman
    bloodhound
    thc-hydra
    # medusa
    radare2
    gobuster
    nikto
    wfuzz
    dirb
    responder
    wpscan
    tcpdump
    gef
    valgrind
    pwndbg
    stripe-cli
    gobject-introspection
    ghunt
    binsider
    flawz
    atac
    sttr
    age
    amass
    subfinder
    rockyou
    crackql
    dnsmap
    altdns
    proxychains
    python312Packages.dirsearch

    # ====== DATABASES ====== #
    postgresql_17
    sqlite

    # ===== CONTAINERS ====== #
    docker_27
    devbox
    virtualbox
    kubectl
    qemu
    virt-manager
    libvirt
    virt-viewer
    bridge-utils
    dnsmasq
    ebtables
    iptables
    OVMF.fd

    # ======== SHELLS ======= #
    zsh
    fish
    nushell
    xonsh
    bash-completion
    bash-preexec
    bashInteractive
    blesh
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-autocomplete
    oh-my-zsh
    oh-my-posh
    oh-my-git
    oh-my-fish
    starship

    # ==== TEXT EDITORS ===== #
    vim
    vscode
    zed-editor
    sublime4
    helix
    vscodium

    # ====== TERMINALS ====== #
    alacritty
    kitty
    warp-terminal
    ghostty

    # = FORMATTERS & LINTERS =#
    alejandra
    deadnix
    nodePackages.prettier
    shellcheck
    shfmt
    statix
    black

    # == LANGUAGE SERVERS === #
    nodePackages.vscode-langservers-extracted # html, css, json, eslint
    nodePackages.yaml-language-server
    nil # nix
    elixir_ls
    metals
    crystalline
    solargraph
    nodePackages.typescript-language-server
    python3Packages.python-lsp-server
    clang-tools
    solargraph

    # ==== CORE LANGUAGES === #
    rustup
    rustc
    ruby
    crystal_1_9
    erlang
    nodejs_22
    go
    elixir_1_18
    # beam.packages.erlangR26.erlang
    # beam.packages.erlangR26.elixir
    dart
    gleam
    scala
    lua
    nim
    devenv

    # ====== GRAPHICS ====== #
    mesa
    glfw
    glew
    glslang
    vulkan-tools
    
    # ======== PYTHON ====== #
    python3Full
    python312Packages.scrapy
    pipx
    python312Packages.cli-helpers
    python312Packages.netifaces
    python312Packages.pip
    poetry
    uv

    # ======= RUST ========= #
    cargo-cache
    cargo-expand

    # ====== WAYLAND ======= #
    wl-clipboard
    polybar
    xwayland
    wdisplays
    hyprland
    swaylock
    waybar
    wofi
    slurp
    grim
    swww
    cliphist

    # ====== WAYUTILS ====== #
    wdisplays
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-utils
  ];

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.blex-mono
    nerd-fonts.inconsolata
    nerd-fonts.agave
    nerd-fonts.anonymice
    nerd-fonts.arimo
    nerd-fonts.aurulent-sans-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.code-new-roman
    nerd-fonts.cousine
    nerd-fonts.envy-code-r
    nerd-fonts.geist-mono
    nerd-fonts.fira-mono
    nerd-fonts.go-mono
    nerd-fonts.hasklug
    nerd-fonts.lilex
    nerd-fonts.meslo-lg
    nerd-fonts.monaspace
    nerd-fonts.monofur
    nerd-fonts.noto
    nerd-fonts.mplus
    nerd-fonts.overpass
    nerd-fonts.profont
    nerd-fonts.recursive-mono
    nerd-fonts.roboto-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.terminess-ttf
    nerd-fonts.zed-mono
    nerd-fonts.space-mono
    nerd-fonts.bitstream-vera-sans-mono
    karla
    julia-mono
    fantasque-sans-mono
    mononoki
    udev-gothic-nf
    hackgen-nf-font
    newcomputermodern
    font-awesome
    powerline-fonts
    powerline-symbols
    noto-fonts-emoji
    noto-fonts
  ];
}