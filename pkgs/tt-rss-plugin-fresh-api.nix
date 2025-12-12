{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "tt-rss-plugin-freshapi";
  version = "0-unstable-2024-11-14";

  src = fetchFromGitHub {
    owner = "eric-pierce";
    repo = "freshapi";
    rev = "942b1c37ef2035444c3a22a21e225f3ece73c705"; # this and the line below needs to be updated based on the git sha of freshapi you want to install
    sha256 = "sha256-XWzEya+1A/UtwTL+HseoX8trEypNjHurK/VF3k2seMQ";
  };

  installPhase = ''
    mkdir -p $out/freshapi
    cp -r api init.php $out/freshapi
  '';

  meta = with lib; {
    description = "Tiny Tiny RSS FreshAPI Plugin";
    longDescription = ''
      A FreshRSS / Google Reader API Plugin for Tiny-Tiny RSS
    '';
    license = with licenses; [ agpl3Only ];
    homepage = "https://github.com/eric-pierce/freshapi";
    maintainers = with maintainers; [ bigloser ];
    inherit (tt-rss.meta) platforms;
  };


  # src = fetchFromGitHub {
  #   owner = "eric-pierce";
  #   repo = "freshapi";
  #   rev = "44c98f12e8a4423501fc6d8cb7903cca11094dc6";
  #   hash = "sha256-1cQ4QMrXOdtelAbmMEuhWJPFi5XrAoR3IGlFzb8122k=";
  # };
  #
  # installPhase = ''
  #   runHook preInstall
  #
  #   install -D init.php $out/freshapi/init.php
  #   install -D api/greader.php $out/freshapi/api/greader.php
  #   install -D api/freshapi.php $out/freshapi/api/freshapi.php
  #
  #   runHook postInstall
  # '';
  #
  # meta = {
  #   description = "FreshRSS / Google Reader API Plugin for Tiny-Tiny RSS";
  #   license = lib.licenses.agpl3Only;
  #   homepage = "https://github.com/eric-pierce/freshapi";
  #   maintainers = with lib.maintainers; [ wrvsrx ];
  #   platforms = lib.platforms.all;
  # };
}

