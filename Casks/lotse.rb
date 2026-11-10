# Source of truth for the tap cask. The release workflow renders 0.1.1 and 74a64946c972a292bb2fac13ed46539b7eada33bbe2c0c89efebb737e69f1ff1
# and commits the result to tankibaj/homebrew-tap as Casks/lotse.rb.
cask "lotse" do
  version "0.1.1"
  sha256 "74a64946c972a292bb2fac13ed46539b7eada33bbe2c0c89efebb737e69f1ff1"

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
