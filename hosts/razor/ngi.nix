{inputs, ...}: {
  security.acme = {
    useRoot = true;
    acceptTerms = true;

    defaults = {
      email = "isakulovdev@gmail.com";
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."aelloc.uz" = {
      serverAliases = ["www.aelloc.uz"];

      forceSSL = true;
      enableACME = true;

      root = inputs.humble.packages."x86_64-linux".default;

      extraConfig = ''
        location / {
          try_files $uri $uri/ /index.html;
        }
      '';
    };

    virtualHosts."qobil.aelloc.uz" = {
      enableACME = true;
      forceSSL = true;

      locations."/" = {
        proxyPass = "http://0.0.0.0:9000";

        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };
    };
  };
}
