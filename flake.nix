{
  description = "sl-graph service";
  
  inputs.nixpkgs.url = "nixpkgs/nixos-22.05";
  
  outputs = { self, nixpkgs }: {
  defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
			src = ./bin.zip;
    name = "slgraphbin";
    version = "1.0.0";
    nativeBuildInputs = [
                            autoPatchelfHook
                            dpkg
                            unzip
                            intel-media-driver
                        ];
    buildInputs = [
        openssl
        udev
        libva
        ffmpeg
        nlohmann_json
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-ugly
        alsa-lib
        grpc
        grpc-tools
        protobuf
        libxml2
        intel-media-sdk
        autoconf
        libtool
        gdb
        unzip
    ];
    unpackPhase = "true";

    installPhase = ''
                mkdir -p $out
                unzip $src -d $out
    '';

    };

 };

}	

