// // Globally useful settings
// // You almost certainly want these
// //
// Disabling ipv6 by default in 20XX??
user_pref("network.dns.disableIPv6", false);
// Disable built in password manager
user_pref("signon.rememberSignons", false);
// Disable useless warnings
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);
// Disable useless "features"
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("identity.fxaccounts.enabled", false);
// Fixes Twitch and other video sites
user_pref("media.autoplay.blocking_policy", 0);
// Allow animations in browser UI
// (Disables disgusting hourglass loading icon)
user_pref("ui.prefersReducedMotion", 0);
// Disable containers (useless conflict with FPI)
user_pref("privacy.userContext.enabled", false);

// // Fix the web settings
// // Revert some privacy/security fixes to improve browsing experience
// //
// Safe(r) with FPI
user_pref("network.http.altsvc.enabled", true);
user_pref("network.http.altsvc.oe", true);
user_pref("security.ssl.disable_session_identifiers", false);
user_pref("security.tls.enable_0rtt_data", true);
// Safe(r) with good search engine
user_pref("browser.search.region", "US");
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.suggest.searches", true);
user_pref("keyword.enabled", true);
// Allow webassembly
user_pref("javascript.options.wasm", true);
// Restore downloads behavior
user_pref("browser.download.useDownloadDir", true);
// Retain history/sessions/downloads on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);
// Allow service workers (and related features)
user_pref("dom.serviceWorkers.enabled", true);
user_pref("dom.push.enabled", true);
// Allow many redirects
user_pref("network.http.redirection-limit", 50);
// Allow websites to use the clipboard from JS
user_pref("dom.allow_cut_copy", true);

// // Anti-tracking settings
// // You probably want these, but they may break particularly weird sites
// //
// Reduce tracking entropy
user_pref("dom.battery.enabled", false);
user_pref("media.media-capabilities.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.storageManager.enabled", false);

// // Setup specific settings
// // These _may_ not work for you, toggle if you have issues
// //
// WebRender
user_pref("gfx.webrender.all", true);
// Fission (separate process per domain)
user_pref("fission.autostart", true);
// Proton (new firefox design)
user_pref("browser.proton.enabled", true);
user_pref("browser.proton.appmenu.enabled", true);
user_pref("browser.proton.tabs.enabled", true);
user_pref("browser.proton.toolbar.enabled", true);
user_pref("browser.proton.urlbar.enabled", true);
user_pref("browser.newtabpage.activity-stream.newNewtabExperience.enabled", true);
// Explicitly disable proton context menu (use native)
user_pref("browser.proton.contextmenus.enabled", false);

// // Personal settings
// //
// Force enable dark mode (only used in browser chrome, ignored on websites with RFP)
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("browser.in-content.dark-mode", true);
// Restore previous session on startup
user_pref("browser.startup.page", 3);
// Disable annoying backspace keybind
user_pref("browser.backspace_action", 2);
// Allow scripts to close their window
user_pref("dom.allow_scripts_to_close_windows", true);
// Disable popup blocker (never has blocked a popup, always gets in the way)
user_pref("dom.disable_open_during_load", false);
// Allow scripts to close the window (useful for kubelogin)
user_pref("dom.allow_scripts_to_close_windows", true);
// UI Density: Compact
user_pref("browser.uidensity", 1);
// Disable separate title bar
user_pref("browser.tabs.drawInTitlebar", true);
// Disable Ctrl-Q shortcut (*nix only)
user_pref("browser.quitShortcut.disabled", true);
// Better scrolling
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.lines.durationMaxMS", 125);
user_pref("general.smoothScroll.lines.durationMinMS", 125);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 200);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 100);
user_pref("general.smoothScroll.other.durationMaxMS", 125);
user_pref("general.smoothScroll.other.durationMinMS", 125);
user_pref("general.smoothScroll.pages.durationMaxMS", 125);
user_pref("general.smoothScroll.pages.durationMinMS", 125);
user_pref("mousewheel.system_scroll_override_on_root_content.horizontal.factor", 175);
user_pref("mousewheel.system_scroll_override_on_root_content.vertical.factor", 175);
user_pref("toolkit.scrollbox.horizontalScrollDistance", 6);
user_pref("toolkit.scrollbox.verticalScrollDistance", 2);
