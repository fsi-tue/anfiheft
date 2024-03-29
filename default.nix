{ nixpkgs ? <nixpkgs>
, doCheck ? true
# To reproduce a build via .github/scripts/reproduce.py:
, date ? null
, srcUrl ? null
}:

with import nixpkgs {};

stdenv.mkDerivation rec {
  pname = "anfiheft";
  version = if (date != null)
    then date
    else lib.fileContents
      (runCommand "anfiheft-date" {} "date --utc +'%F' > $out");

  src = if srcUrl != null
    then fetchTarball srcUrl
    else lib.cleanSource ./.;

  inherit doCheck;

  nativeBuildInputs = [
    (texlive.combine {
      inherit (texlive) scheme-minimal latexmk latexconfig latex latex-bin
        collection-fontsrecommended babel babel-german hyphen-german
        graphics oberdiek tools enumitem qrcode xcolor xkeyval colortbl
        hyperref url csvsimple pgf etoolbox fontawesome5 l3kernel l3packages
        hycolor atveryend epstopdf-pkg;
    })
  ];
  checkInputs = [ pdftk ];

  postPatch = ''
    # Set SOURCE_DATE_EPOCH to make the build reproducible:
    export SOURCE_DATE_EPOCH="$(date --date=$version +'%s')"
    # Changes for the Nix build:
    sed -i 's,/usr/bin/env bash,${bash}/bin/bash,' Makefile
    # Override the LaTeX values for \today:
    # TODO:
    #sed -i "s,\\year=\\year,\\year=$(date --date=$version +'%Y')," src/env.tex
    #sed -i "s,\\month=\\month,\\month=$(date --date=$version +'%m')," src/env.tex
    #sed -i "s,\\day=\\day,\\day=$(date --date=$version +'%d')," src/env.tex
    # Make sure that we build from scratch:
    make distclean
  '';

  buildPhase = ''
    # Build the PDFs
    make
  '';

  checkPhase = ''
    # Make sure that the number of pages is divisible by 4:
    make check
  '';

  installPhase = ''
    mkdir $out
    cp anfiheft-kogni.pdf $out
    cp anfiheft-info.pdf $out
  '';
}
