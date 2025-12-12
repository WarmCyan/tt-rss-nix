{
  lib,
  pkgs,
}:

pkgs.stdenv.mkDerivation rec {
  pname = "tt-rss-theme-feedly";
  version = "4.1.0";

  # src = fetchFromGitHub {
  #   owner = "levito";
  #   repo = "tt-rss-feedly-theme";
  #   rev = "v${version}";
  #   sha256 = "sha256-3mD1aY7gjdvucRzY7sLmZ1RsHtraAg1RGE/3uDp6/o4=";
  # };
  src = pkgs.fetchFromGitHub {
    owner = "levito";
    repo = "tt-rss-feedly-theme";
    rev = "9b50cee70e1ed77d27a273e267c2f50455a23e6f";
    sha256 = "sha256-0U2APDh++U7qWwv9ky9nEZ8WvsSbWBTSUwqQqkIkaqU=";
  };


  dontBuild = true;

  installPhase = ''
    mkdir $out

    cp -ra feedly *.css $out
  '';
  #
  # meta = with lib; {
  #   description = "Feedly theme for Tiny Tiny RSS";
  #   license = licenses.mit;
  #   homepage = "https://github.com/levito/tt-rss-feedly-theme";
  #   maintainers = with maintainers; [ das_j ];
  #   platforms = platforms.all;
  # };
}

