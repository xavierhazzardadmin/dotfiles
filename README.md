# Xavier's dotfiles

## This is a list of all of my dotfiles

NERDTree is the file manager tree.
I have CTRL-T to toggle it in normal mode.
I also have icons for it so that I can tell
what type of files I have without needing to look at the extension.

My favourite plugin though, is COC (Conquer of Completion). This 
one is amazing and comes with loads of sub-plugins. I have 6 plugins
currently, all are listed in my `.vimrc`. The main three I use are 
`coc-eslint`, `coc-prettier` and `coc-tsserver`. `coc-tsserver` is 
especially helpful as it not only has auto-complete, but intergrates
directly into typescript and will update as I install new types for 
new node_modules that I work with in my projects.

A few other honorable mentions are:

* `gitgutter` which shows on each
  line an indication if I have added something that is not in my git
  repo, taken that one is initialized in the folder.

* `vim-commentary` which makes it easy for my to write comments in
    my code no matter the language is. 

* `ctrl-p.vim` which allows me to fuzzy file search whilst still in a vim window and not have to worry about saving my work as it stays in the buffer. 

## COC

Using this is pretty simple.

Firstly, add it to your `.vimrc` / `.init.vim`.

Then save, do `so %`, and then `PlugInstall` or alternative command 
to install plugins. 

Next, re-open vim and do :CocInstall + the coc plugins you want.

for instance

```
:CocInstall coc-eslint coc-prettier coc-tsserver
```

Or you can install these globally and then it will install automatically, see vimrc for more details

then hit enter and wait whilst it installs them.

Once it's finished, do :CocConfig which will create a config file and
open it.

Copy the contents of my `.vim/coc-settings.json` into yours and save.

Now you should be all set to use coc.vim.

One last thing to mention would be to go through my vimrc
and add anything you like to yours.




Fun Fact: TypeScript was designed by the same dude as C#
