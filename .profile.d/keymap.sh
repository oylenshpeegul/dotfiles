
# Make the Enter key an extra Ctrl key.
# sudo apt-get install xcape

xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add control = 0x1234'
xmodmap -e 'keycode any = Return'
xcape -e '0x1234=Return'

# Emacs will complain: <key-4660> is undefined, so evaluate the following:
# (global-set-key (kbd "<key-4660>") 'ignore)
