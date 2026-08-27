{
  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;

    open = true;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}
