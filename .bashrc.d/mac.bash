# Make a directory and change to it.
# function mac {
#    mkdir -p "$1" && cd $_ 
# }

# https://twitter.com/pjacklam/status/1399800650276380672
mac () {
    mkdir -p -- "$1" && cd -- "$1"
}
