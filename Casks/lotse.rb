# Source of truth for the tap cask. The release workflow renders 0.1.3 and 891c02c552da388081f257a6d158ca9032ec96fd4f88d04ac38da78238c9a6cd
# and commits the result to tankibaj/homebrew-tap as Casks/lotse.rb.
cask "lotse" do
  version "0.1.3"
  sha256 "891c02c552da388081f257a6d158ca9032ec96fd4f88d04ac38da78238c9a6cd"

  url "https://github.com/tankibaj/lotse/releases/download/v#{version}/Lotse-#{version}-arm64.zip"
  name "Lotse"
  desc "Terminal with projects and agent awareness"
  homepage "https://github.com/tankibaj/lotse"

  depends_on arch: :arm64
  depends_on :macos

  app "Lotse.app"

  # The build is ad-hoc signed and not notarized: drop quarantine so Gatekeeper does not block launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Lotse.app"]
  end

  zap trash: [
    "~/Library/Application Support/Lotse",
    "~/Library/Caches/dev.tankibaj.lotse",
    "~/Library/Preferences/dev.tankibaj.lotse.plist",
    "~/Library/WebKit/dev.tankibaj.lotse",
  ]
end
