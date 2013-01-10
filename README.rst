Vim files for working on Salt files.

Installing::

    cp -r ftdetect ftplugin syntax  ~/.vim/

    Files can be copied into any other directory where vim looks 
    for its runtime files, like /etc/vim/.

    Command ':set runtimepath' will show all such paths.
    Read ':help runtimepath' for more info.


syntax/sls.vim
    syntax file for editing yaml + jinja sls files.

ftplugin/sls.vim
    Filetype plugin with good default config for SLS files.
    Configures suitable wrapping, folding and indenting.
    Added features:
      - All tabs are converted to spaces.
      - Tab key indents by 2 spaces.
      - Commets will be hardwrapped (with added leading #)
        This is done by setting formatoptions.
      - <Space> key will try to fold/unfold an area.
      - Visually selected block might be indented and unindented 
        by keys '<' and '>', keeping the visual selection selected.
      - Improved indenting of yaml expressions with custom indenting function/
      - Visual warning for non-ascii characters (which are not allowed in yaml)

ftdetect/sls.vim
    Detect SLS file by postfix .sls



Other VIM plugins you might find interesting:

    - Powerline: https://github.com/Lokaltog/vim-powerline
    - NERDTree: https://github.com/scrooloose/nerdtree 
    - Gundo: https://github.com/sjl/gundo.vim/
    - TabMan: https://github.com/kien/tabman.vim
    - PythonMode: https://github.com/klen/python-mode
    - FuzzyFinder: https://github.com/vim-scripts/FuzzyFinder
    - CtrlP: http://kien.github.com/ctrlp.vim/

How to install those plugins in a manageable way? Use one of those:

    - Pathogen: https://github.com/tpope/vim-pathogen
    - Vundle: https://github.com/gmarik/vundle


