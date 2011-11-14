# シェル変数 path をuniqueに
typeset -U path
# $HOME/local/bin があれば先頭に追加
path=($HOME/local/bin(N) $path)
# perlbrew
source $HOME/perl5/perlbrew/etc/bashrc
# flex_sdk
path=(/Developer/SDKs/flex_sdk_4/bin(N) $path)

export LANG=ja_JP.UTF-8

# nvm
source $HOME/.nvm/nvm.sh
