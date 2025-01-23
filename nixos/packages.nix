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
    dog
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

    # ===== NIX RELATED ====== #
    nix-output-monitor
    nix-prefetch-github

    # ===== PRODUCTIVITY ===== #
    hugo
    glow
    obsidian
    fabric-ai
    siyuan
    vivaldi
    anki
    xournalpp
    zathura

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

    # ====== DATABASES ====== #
    postgresql_17

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
    bash-completion
    bash-preexec
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-autocomplete
    oh-my-zsh
    oh-my-posh
    oh-my-git
    oh-my-fish

    # ==== TEXT EDITORS ===== #
    vim
    vscode
    zed-editor
    sublime4
    helix
    vscodium
    code-cursor

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
    nodejs_23
    go
    elixir_1_18
    # beam.packages.erlangR26.erlang
    # beam.packages.erlangR26.elixir
    dart
    gleam
    scala
    lua
    nim

    # ======== PYTHON ====== #
    python3Full
    python312Packages.scrapy
    pipx
    python312Packages.cli-helpers
    python312Packages.netifaces
    python312Packages.pip
    poetry

    # ======= RUST ========= #
    cargo-cache
    cargo-expand

    # ====== WAYLAND ======= #
    wl-clipboard
    polybar
    xwayland
    wdisplays
  ];

  fonts.packages = with pkgs; [
    nerd-fonts
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