cask "timebuddy" do
  arch arm: "arm64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "2a68965b1bb92ed95355a7dca65b9a1b452335bec9419d168771ae999238539d",
         intel: "98cdf7c63d3f627df6e198143fcc97681876029aa7c9219bcde405f227914546"

  url "https://github.com/misterbisson/timebuddy-incident-investigator/releases/download/v#{version}/Timebuddy-Incident-Investigator-#{version}-#{arch}.dmg"
  name "Timebuddy Incident Investigator"
  desc "MCP server + connection manager for Grafana/Graylog incident investigation"
  homepage "https://github.com/misterbisson/timebuddy-incident-investigator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Timebuddy Incident Investigator.app"

  zap trash: "~/Library/Application Support/Timebuddy Incident Investigator"

  caveats <<~EOS
    The first time Claude launches Timebuddy as an MCP server, macOS shows a
    one-time keychain prompt to decrypt your saved connection credentials —
    click Allow.
  EOS
end
