# typed: false
# frozen_string_literal: true

# kioku v1.0.2 — rendered by scripts/render-homebrew-formula.sh from
# packaging/homebrew/kioku.rb.tmpl in misorafa/kioku (SPEC-M3.3 §1). Do not edit here:
# every release overwrites this file.
class Kioku < Formula
  desc "Self-hosted, Japanese-first shared memory for AI coding agents"
  homepage "https://github.com/misorafa/kioku"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.2/kioku-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "ea10c88ccdf4421e3dae4bffca0bc50885591b53b94d253fee3d0ac1e9b276c0"
    end
    on_intel do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.2/kioku-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "d5afe16f42e0ae54ffcd84e896cc11693d5f83aefa79c16ca1ef26c5c652b3e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.2/kioku-v1.0.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "adba4b00be7932e1c1044c9b5024a8f83b7cf73cf8308389fe49ea6741f8fb54"
    end
    on_intel do
      url "https://github.com/misorafa/kioku/releases/download/v1.0.2/kioku-v1.0.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f875c13173d1da530316bfac1f84a37d18b653a7a8a45c907abf8f901b012bb8"
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
