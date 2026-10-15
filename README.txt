Hello and welcome to a simple nvim setup built to work on the MiNI faculty computer network! Based on the setup I use on my own machine. Because FUCK INTELLIJ AND THEIR DOGSHIT IDEs

1. SETUP
-create the neovim config folder at '~/.config/nvim' if it does not exist yet
-clone the contents of this repositiory inside of it.
-somehow set up lazy. idk for now, i don't remember how i did it. i'll change this later
-literally just run neovim. you are chill.

2. TROUBLESHOOTING
- LAZY.NVIM FAILS TO DOWNLOAD : check the lazypath variable in lua/config/lazy.lua (it is at the very top of the file). It should be saving to something you have acess to. i set it to save in the nvim config folder, but you can change that
