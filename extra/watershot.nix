pkgs: let
  src = pkgs.fetchFromGitHub {
    owner = "Gigas002";
    repo = "watershot";
    rev = "4a0812495be35c4c2751bcab6b20d54977bb66a9";
    hash = "sha256-RFConZFmY4VNdk4TWN634WzsAdIxrQiRHgkgCQwqFdc=";
  };
  cargo = builtins.fromTOML (builtins.readFile (src + "/Cargo.toml"));
in
  pkgs.rustPlatform.buildRustPackage {
    pname = cargo.package.name;
    version = cargo.package.version;
    src = pkgs.lib.cleanSource src;
    cargoLock = {
      lockFile = src + "/Cargo.lock";
      outputHashes = {
        "hyprland-0.4.0-beta.2" = "sha256-UW/maNyrZ8F8zv/WcYbDbXxynn+vVJmrTTKuG1PHp0E=";
        "libwayshot-0.3.2-dev" = "sha256-Ci10lqejSwh8NaP2wFH1DL7yW0XbMfBokjYJ9kFZTf8=";
      };
    };

    nativeBuildInputs = with pkgs; [
      makeWrapper
      rustc
      pkg-config
      cmake
      # Explicitly include the C compiler wrapper
      gcc
    ];

    buildInputs = with pkgs; [
      # Wayland dependencies
      wayland
      wayland-protocols
      libxkbcommon
      libGL
      libglvnd

      # Graphics/WGPU
      vulkan-loader
      libgbm
      libdrm

      # Fonts
      fontconfig
      freetype
    ];

    # Force the linker to find these libraries at build time
    RUSTFLAGS = "-L ${pkgs.libGL}/lib -L ${pkgs.libxkbcommon}/lib -L ${pkgs.wayland}/lib -L ${pkgs.fontconfig.lib}/lib";

    # Required for runtime shared object loading
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
      with pkgs; [
        wayland
        libxkbcommon
        libGL
        libglvnd
        vulkan-loader
        fontconfig
        freetype
      ]
    );

    # Ensure pkg-config looks in the right places
    PKG_CONFIG_PATH = pkgs.lib.concatStringsSep ":" [
      "${pkgs.wayland.dev}/lib/pkgconfig"
      "${pkgs.libxkbcommon.dev}/lib/pkgconfig"
      "${pkgs.fontconfig.dev}/lib/pkgconfig"
      "${pkgs.freetype.dev}/lib/pkgconfig"
      "${pkgs.libgbm}/lib/pkgconfig"
    ];
    postFixup = ''
      patchelf --add-rpath ${pkgs.vulkan-loader}/lib $out/bin/watershot
      patchelf --add-rpath ${pkgs.libGL}/lib $out/bin/watershot

      # wrapProgram $out/bin/watershot \
      #   --add-flags "-g \"${pkgs.grim}/bin/grim\""
    '';
  }
