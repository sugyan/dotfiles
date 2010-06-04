# シェル変数 path をuniqueに
typeset -U path
# $HOME/local/bin があれば先頭に追加
path=($HOME/local/bin(N) $path)
# perlbrew
path=($HOME/perl5/perlbrew/bin(N) $HOME/perl5/perlbrew/perls/current/bin(N) $path)

export LANG=ja_JP.UTF-8
