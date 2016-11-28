class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.4.0.tar.gz"
  sha256 "224dc3a95bf966d4a4cd7b9b34c966cfa5347143c50235f4adde2537521eacf3"

  def install
    bin.install Dir["bin/*"]
    (prefix/"etc/profile.d").install "bp4o.bash" => "bp4o.sh"
    (share/"zsh/site-functions").install "bp4o.zsh" => "bp4o"
    (share/"fish/vendor_functions.d").install "bp4o.fish" => "p4.fish"
  end

  def caveats; <<-EOS.undent
    Bash users, add the following to your ~/.bash_profile:
      if [ -f $(brew --prefix)/etc/profile.d/bp4o.sh ]; then
        . $(brew --prefix)/etc/profile.d/bp4o.sh
      fi

    Zsh users, add the following to your ~/.zshrc:
      autoload -Uz bp4o
      bp4o
    EOS
  end
end
