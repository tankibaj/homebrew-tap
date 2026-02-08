class AfmApiAT12 < Formula
  desc "OpenAI-compatible local server for Apple Foundation Model"
  homepage "https://github.com/tankibaj/apple-foundation-model-api"
  url "https://github.com/tankibaj/apple-foundation-model-api/releases/download/v1.2.0/afm-api-macos-arm64.tar.gz"
  version "1.2.0"
  sha256 "1d680377eacb3325d15f0f210513083da28bff9284b5df00bd5fb335ff342dfa"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/afm-api"
    pkgshare.install "src/afm-api.swift"

    # Make the launcher reference the Homebrew-installed Swift source path.
    inreplace bin/"afm-api", %r{\$SCRIPT_DIR/\.\./src/afm-api.swift}, "#{pkgshare}/afm-api.swift"
  end

  test do
    assert_predicate bin/"afm-api", :exist?
    assert_predicate pkgshare/"afm-api.swift", :exist?
  end
end
