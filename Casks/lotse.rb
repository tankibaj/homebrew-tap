# Source of truth for the tap cask. The release workflow renders 0.1.2 and 920bee9c4bd0a6a1038ce21d81d52a7c5fe096dd6dc680a74e040b44945c62d1
# and commits the result to tankibaj/homebrew-tap as Casks/lotse.rb.
cask "lotse" do
  version "0.1.2"
  sha256 "920bee9c4bd0a6a1038ce21d81d52a7c5fe096dd6dc680a74e040b44945c62d1"

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
