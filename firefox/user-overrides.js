// Safe(r) with FPI
user_pref("network.http.altsvc.enabled", true);
user_pref("network.http.altsvc.oe", true);
user_pref("security.ssl.disable_session_identifiers", false);
user_pref("security.tls.enable_0rtt_data", true);

// Restore previous session
user_pref("browser.startup.page", 3);

// Safe(r) with good search engine
user_pref("browser.search.region", "US");
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.suggest.searches", true);
user_pref("keyword.enabled", true);

// Reduce tracking entropy
user_pref("dom.battery.enabled", false);
user_pref("media.media-capabilities.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.storageManager.enabled", false);

// Retain web fonts
user_pref("browser.display.use_document_fonts", 1);

// Disabling ipv6 by default in 20XX??
user_pref("network.dns.disableIPv6", false);

// Disable built in password manager
user_pref("signon.rememberSignons", false);

// Prevent clipboard hijacking
user_pref("dom.event.clipboardevents.enabled", true);

// Allow wasm
user_pref("javascript.options.wasm", true);

// Force enable dark mode (currently ignored with RFP enabled)
user_pref("ui.systemUsesDarkTheme", 1);

// Restore downloads behavior
user_pref("browser.download.useDownloadDir", true);

// Block cookies from unvisited websites
// But disable FF blocker for other requests (useless conflict with uBlock Origin)
user_pref("network.cookie.cookieBehavior", 3);
user_pref("privacy.trackingprotection.cryptomining.enabled", false);
user_pref("privacy.trackingprotection.fingerprinting.enabled", false);
user_pref("privacy.trackingprotection.socialtracking.enabled", false);

// Retain history/sessions/downloads on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);

// Disable useless warnings
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);

// Disable annoying backspace keybind
user_pref("browser.backspace_action", 2);

// Disable useless "features"
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("identity.fxaccounts.enabled", false);

// Disable RFP letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);

// Allow service workers (and related features)
user_pref("dom.serviceWorkers.enabled", true);
user_pref("dom.push.enabled", true);

// Allow animations in browser UI
// (Disables disgusting hourglass loading icon)
user_pref("ui.prefersReducedMotion", 0);

// Fixes twitch and other video sites
user_pref("media.autoplay.blocking_policy", 0);

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
