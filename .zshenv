# シェル変数 path をuniqueに
typeset -U path
#　$HOME/local/bin があれば先頭に追加
path=($HOME/local/bin(N) $path)
