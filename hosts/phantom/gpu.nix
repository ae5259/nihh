{...}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;
      modesetting.enable = true;

      prime = {
        offload.enable = true;

        intelBusId = "PCI:0@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
    };
  };
}
