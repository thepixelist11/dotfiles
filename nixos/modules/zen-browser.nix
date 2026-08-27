{
  inputs,
  pkgs,
  lib,
  ...
}:

let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = { };

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
    (extension "darkreader" "addon@darkreader.org")
    (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
    (extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}")
    (extension "sponsorblock" "sponsorBlocker@ajay.app")
    (extension "enhancer-for-youtube" "enhancerforyoutube@maximerf.addons.mozilla.org")
    (extension "user-agent-string-switcher" "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}")
    (extension "karakeep" "addon@karakeep.app")
    (extension "copy-as-markdown" "jid1-tfBgelm3d4bLkQ@jetpack")
    (extension "tubearchivist-companion" "{08f0f80f-2b26-4809-9267-287a5bdda2da}")
    (extension "tabdetach" "tabenhanced@firefox")
  ];

in
{
  environment.systemPackages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
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
