# Linting on OSX

To get lsp to work with C++ on OSX a file called '.clangd' can be placed in the home directory.

A tutorial on how to do it is available on medium. Many thanks to Michael Bao for sharing.

Links:

https://medium.com/linux-with-michael/how-to-setup-clangd-with-gcc-headers-and-neovim-lsp-for-competitive-programming-2f3f98425ae1


## Creating the directory listing.

1. Install gcc with 'brew install gcc@13'. Note that this is not the OSX default compiler (clang) which is linked
   to gcc by Apple.

2. use the command 'gcc-13 -E -v -xc++ /dev/null' to dump the current settings for the installed gcc version.

3. Update the '.clangd' file with the correct path names.

