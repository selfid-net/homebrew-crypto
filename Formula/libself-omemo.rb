# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy.rb"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-omemo/archive/0.1.2.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "78326c487dd5afcabe170d09b2e116a3cac43f008836f3b3ea9cfc3657985740"

  bottle do
    root_url "https://dl.bintray.com/selfid/bottles-crypto"
    cellar :any
    sha256 "985206fb61b6e9006027eba76bc30d120c16099caf0f56ee8ce26f41c32575bb" => :catalina
  end

  depends_on "rust" => :build
  depends_on "libself-olm"
  depends_on "libsodium"

  def install
    system "cargo", "build", "--release"
    lib.install "target/release/libself_omemo.dylib"
    include.install "self_omemo.h"
  end

  test do
    system "true"
  end
end
