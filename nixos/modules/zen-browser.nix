{ inputs, pkgs, lib, ... }:

let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    "extensions.pocket.enabled" = false;
  };

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
  ];

in
{
  environment.systemPackages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
          ) prefs
        );

        extraPolicies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          DisableFirefoxScreenshots = true;
          DisablePocket = true;
          DisableAccounts = true;
          DisableFirefoxAccounts = true;
          DisableRemoteImprovements = true;
          DisableFormHistory = true;
          SearchSuggestEnabled = false;

          ExtensionSettings = builtins.listToAttrs extensions;

          NoDefaultBookmarks = true;

          AllowFileSelectionDialogs = true;
          DisableFeedbackCommands = true;
          PromptForDownloadLocation = true;

          PasswordManagerEnabled = false;
          AutofillCreditCardEnabled = false;
          AutofillAddressEnabled = false;

          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };

          SearchEngines = {
            Default = "ddg";
            Add = [
              {
                Name = "NixOS packages";
                URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@np";
              }
              {
                Name = "NixOS options";
                URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@no";
              }
              {
                Name = "NixOS Wiki";
                URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@nw";
              }
              {
                Name = "DuckDuckGo";
                URLTemplate = "https://duckduckgo.com/?q={searchTerms}";
                IconURL = "https://duckduckgo.com/favicon.ico";
                Alias = "@ddg";
              }
            ];
          };
        };
      }
    )
  ];
}
