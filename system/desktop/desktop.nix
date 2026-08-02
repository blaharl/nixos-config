{ pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define your hostname.
  networking.hostName = "debian";

  services.xserver.videoDrivers = [ "amdgpu" ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      # used to be necessary, but doesn't seem to anymore
      HCC_AMDGPU_TARGET = "gfx1101";
    };
    rocmOverrideGfx = "11.0.1";
  };

  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-rocm;
    port = 8085;
  };

  hardware = {
    graphics = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        # rocm-opencl-runtime
      ];
    };
  };

  environment.systemPackages = with pkgs; [ llama-cpp-rocm ];
}
