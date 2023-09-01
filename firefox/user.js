// // Globally useful settings
// // You almost certainly want these
// //
// Disable useless warnings
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);
// Disable useless "features"
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("identity.fxaccounts.enabled", false);
// Disable containers context menu
user_pref("privacy.userContext.enabled", false);
// Increase connection count per-domain
// (Trust me you want this)
user_pref("network.http.max-persistent-connections-per-server", 64);
// Disable "you have unsent crash reports" popup that is bugged
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
// Disable WebRTC popup
user_pref("privacy.webrtc.legacyGlobalIndicator", false);
user_pref("privacy.webrtc.hideGlobalIndicator", true);
// Allow many redirects
user_pref("network.http.redirection-limit", 50);
// Disable Ctrl-Q shortcut (*nix only)
user_pref("browser.quitShortcut.disabled", true);
// Disable "Recommended Addons"
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
// Disable startup welcome nag screen
user_pref("browser.aboutwelcome.enabled", false);
// Auto reject cookie banners
user_pref("cookiebanners.service.mode", 2);
// Don't let websites prevent opening in pdfjs
user_pref("browser.helperApps.showOpenOptionForPdfJS", true);
user_pref("browser.download.open_pdf_attachments_inline", true);

// // "I use a password manager" settings
// // Turns off browser features that are useless if you have a password manager
// //
// Never autofill forms or ask to remember addresses/passwords/cards/etc
user_pref("signon.rememberSignons", false);
user_pref("dom.forms.autocomplete.formautofill", false);
user_pref("browser.formfill.enable", false);
user_pref("signon.generation.available", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.autofillForms", false);
user_pref("signon.storeWhenAutocompleteOff", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
// Disable FF accounts
user_pref("identity.fxaccounts.enabled", false);

// // Privacy/Security settings
// // You probably want these, but they may break particularly weird sites
// //
// HTTPS only mode
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
// Enable GPC (believe it or not, some sites respect this)
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);
user_pref("privacy.globalprivacycontrol.enabled", true);
// Disable largely useless features that help trackers
user_pref("dom.battery.enabled", false);
user_pref("media.media-capabilities.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.storageManager.enabled", false);
// Disable largely useless features that increase attack surface
user_pref("browser.uitour.enabled", false);
// It's slow, stalls your connection, and leaks sites you visit to CAs
// Websites that care about security are already stapling OCSP responses
user_pref("security.OCSP.enabled", 0);
user_pref("security.OCSP.require", false);
// CRLite: Does what OCSP does but good
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);
// Broken TLS is unsafe
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl.require_safe_negotiation", true);
// Always show punycode to avoid phishing
user_pref("network.IDN_show_punycode", true);

// // Privacy/Security settings (Strict Edition)
// // More likely to break the web or disable features you use
// //
// Enable ETP in "Strict" mode ("Strict" mode will also enable TCP i.e. dFPI)
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("browser.contentblocking.category", "strict");
// Trim "Referer" header
user_pref("network.http.referer.XOriginPolicy", 1);
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
// Disable a11y services (re-enable if you use them)
user_pref("accessibility.force_disabled", 1);
// Disable "Firefox View" tab
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.firefox-view-next", false);

// // Setup specific settings
// // These _may_ not work for you, toggle if you have issues
// //
// WebRender
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor.force-enabled", true);
// Fission (process-based isolation)
user_pref("fission.autostart", true);
// Explicitly disable proton context menu (use native)
user_pref("browser.proton.contextmenus.enabled", false);
// VAAPI decoding
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.av1.enabled", true);

// // Personal settings
// //
// Force enable dark mode
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("browser.in-content.dark-mode", true);
user_pref("layout.css.prefers-color-scheme.content-override", 0);
// Enable dark theme
user_pref("extensions.activeThemeID", "default-theme@mozilla.org");
// UI density "Normal"
user_pref("browser.uidensity", 0);
// Restore previous session on startup
user_pref("browser.startup.page", 3);
// Blank new tab page
user_pref("browser.newtabpage.enabled", false);
// Disable annoying backspace keybind
user_pref("browser.backspace_action", 2);
// Allow scripts to close their window
user_pref("dom.allow_scripts_to_close_windows", true);
// Disable popup blocker (never has blocked a popup, always gets in the way)
user_pref("dom.disable_open_during_load", false);
// Allow scripts to close the window (useful for kubelogin)
user_pref("dom.allow_scripts_to_close_windows", true);
// Disable separate title bar
user_pref("browser.tabs.drawInTitlebar", true);
// Disable middle click opening tab from clipboard
user_pref("browser.tabs.searchclipboardfor.middleclick", false);
// Disable "Quarantined Domains"
user_pref("extensions.quarantinedDomains.enabled", false);
// Disable top sites in URL bar recommendations
user_pref("browser.urlbar.suggest.topsites", false);
// Enable actually useful URL bar recommendations
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("browser.urlbar.unitConversion.enabled", true);
// Better scrolling
user_pref("apz.overscroll.enabled", true);
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12);
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", 2.0);
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250);
user_pref("general.smoothScroll.currentVelocityWeighting", 1.0);
user_pref("general.smoothScroll.stopDecelerationWeighting", 1.0);
user_pref("mousewheel.default.delta_multiplier_y", 300);
