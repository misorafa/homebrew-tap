# typed: false
# frozen_string_literal: true

# kioku v1.0.1 — rendered by scripts/render-homebrew-formula.sh from
# packaging/homebrew/kioku.rb.tmpl in misorafa/kioku (SPEC-M3.3 §1). Do not edit here:
# every release overwrites this file.
class Kioku < Formula
  desc "Self-hosted, Japanese-first shared memory for AI coding agents"
  homepage "https://github.com/misorafa/kioku"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.1/kioku-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "31c5ef56961803e295456f5a28c6d07723c560178060fcbe6f9e21bddb967dda"
    end
    on_intel do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.1/kioku-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "91756852a6960d9266e674b2514caf9ce6bf36ca73ddf239ee8344a4d0e3f294"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.1/kioku-v1.0.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd007878f64118bbeaca23ffb13876e43935199bb6f2339fc8c7e5cce932da37"
    end
    on_intel do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.1/kioku-v1.0.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1389f099d632ba8e82074933f36b3c0cbd8b96a451aa173b816e95a542c74a16"
    end
  end

  def install
    bin.install "kioku"
  end

  def caveats
    <<~EOS
      Set up this machine (config, background service, hooks + MCP for every agent):
        kioku setup
      or join an existing server with the line `kioku invite` prints there.

      Updates come from Homebrew: kioku update only prints `brew upgrade kioku`.
      To remove kioku's hooks, service and PATH entries before uninstalling:
        kioku uninstall && brew uninstall kioku
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kioku --version")
  end
end
