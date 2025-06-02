{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        package = pkgs.librewolf;
        policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        Preferences = {
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.contentblocking.category" = "strict";
            "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
            "cookiebanners.service.mode" = 2; # Block cookie banners
            "privacy.history.custom" = true;
            "privacy.globalprivacycontrol.was_ever_enabled" = true;
            "privacy.clearOnShutdown_v2.formdata" = true;
            "privacy.clearOnShutdown_v2.siteSettings" = true;
            "privacy.donottrackheader.enabled" = true;
            "privacy.fingerprintingProtection" = true;
            "privacy.resistFingerprinting" = true;
            "privacy.trackingprotection.emailtracking.enabled" = true;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.fingerprinting.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
        };
        ExtensionSettings = {
            "uBlock0@raymondhill.net" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                installation_mode = "force_installed";
            };
            "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
                installation_mode = "force_installed";
            };
            "sponsorBlocker@ajay.app" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/file/4465727/sponsorblock-5.11.10.xpi";
                installation_mode = "force_installed";
            };
            "leechblockng@proginosko.com" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/file/4466262/leechblock_ng-1.6.9.xpi";
                installation_mode = "force_installed";
            };
        };
        };
        profiles.karl = {
            name = "karl";
            isDefault = true;

            bookmarks = [
                {
                name = "Books";
                bookmarks = [
                    {
                        name = "LaTeX Mathematics";
                        url = "https://en.wikibooks.org/wiki/LaTeX/Mathematics";
                    }
                    {
                        name = "LaTeX Punctuation";
                        url = "https://de.wikibooks.org/wiki/LaTeX-W%C3%B6rterbuch:_Anf%C3%BChrungszeichen";
                    }
                    {
                        name = "Modern OpenGL";
                        url = "https://raw.githubusercontent.com/Overv/Open.GL/master/ebook/Modern%20OpenGL%20Guide.pdf";
                    }
                ];
                }
                {
                name = "Comics";
                bookmarks = [
                    {
                        name = "Bas Space Comics";
                        url = "https://www.badspacecomics.com/";
                    }
                    {
                        name = "Pizzacakecomic";
                        url = "https://pizzacakecomic.com/";
                    }
                    {
                        name = "Zez Vaz";
                        url = "https://zezvaz.com/cartoons/";
                    }
                ];
                }
            ];
        };
    };
}