
# edit file with root privs
alias E="EDITOR=\"emacsclient -c -a emacs\" sudoedit"

alias burnit='cdrdao write --driver generic-mmc-raw cd.toc && rm *.wav'

# start the Clojure REPL
alias clj='java -cp ~/clojure/clojure-1.7.0/clojure-1.7.0.jar clojure.main'
alias clojure=clj
