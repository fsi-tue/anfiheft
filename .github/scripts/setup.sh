#!/usr/bin/env bash

mkdir -p ~/.config/nixpkgs/

cat <<EOF > ~/.config/nixpkgs/config.nix
{
  allowInsecurePredicate = pkg: pkg.pname == "xpdf";
}
EOF
