#!/bin/bash
# Regenera o indice do repo. Rode na raiz do repo depois de adicionar/remover .deb em debs/.
# Precisa do dpkg-dev (Linux) ou do pacote dpkg no Homebrew (macOS).
set -e
cd "$(dirname "$0")"
dpkg-scanpackages -m ./debs /dev/null > Packages
bzip2 -fk Packages
gzip -fk Packages
echo "Packages, Packages.bz2 e Packages.gz atualizados."
