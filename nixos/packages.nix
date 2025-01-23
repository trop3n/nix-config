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
    obs-studio
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
#    natron

    # ======= BROWSERS ======= #
    firefox-devedition
    brave
    tor
    chromium
    google-chrome

    # ==== SECURITY TOOLS ==== #
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

    # ===== CONTAINERS ====== #
    docker_27
    devbox
    virtualbox
    kubectl

    # ======== SHELLS ======= #
    zsh
    fish
    bash-completion
    bash-preexec
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-autocomplete

    # ==== TEXT EDITORS ===== #
    vim
    vscode
    zed-editor
    sublime4
    helix
    vscodium
    code-cursor

    
  ];
}