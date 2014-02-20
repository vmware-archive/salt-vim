===================================
Vim files for working on Salt files
===================================

Installing
==========

::

    cp -r ftdetect ftplugin syntax  ~/.vim/

Or (preferably) use one of the popular tools to (sanely) manage plugins:

- `Pathogen <https://github.com/tpope/vim-pathogen>`_
- `Vundle <https://github.com/gmarik/vundle>`_

You will also need to specify the following settings in your ``~/.vimrc``:

.. code-block:: vim

    set nocompatible
    filetype plugin indent on

Note: It's possible you may be presented with an error stating something
similar to:

"E319: Sorry, the command is not available in this version: filetype plugin
indent on"

If you get this, specify the following settings in your ``~/.vimrc`` instead:

.. code-block:: vim

    set nocompatible
    set tabstop=2
    set shiftwidth=2
    set expandtab

Alternately, files can be copied into any other directory where Vim looks for
its runtime files, like ``/etc/vim/``. The command ``:set runtimepath`` will
show all such paths. Read ``:help runtimepath`` for more info.

Files
=====

``syntax/sls.vim``
    Syntax file for editing YAML + Jinja SLS files.

``ftplugin/sls.vim``
    Filetype plugin with good default config for SLS files. Configures suitable
    wrapping, folding and indenting. Added features:

    - All tabs are converted to spaces.
    - Tab key indents by 2 spaces.
    - Comments are hardwrapped (with added leading ``#``).
      This is done by setting ``formatoptions``.
    - <Space> key will try to fold/unfold an area.
    - Visually selected block might be indented and unindented
      by keys ``<`` and ``>``, keeping the visual selection selected.
    - Improved indenting of YAML expressions with custom indenting function.
    - Visual warning for non-ASCII characters (which are not allowed in YAML).

``ftdetect/sls.vim``
    Detect SLS file by the file extension ``.sls``.


Other VIM plugins you might find interesting
============================================

- `Powerline <https://github.com/Lokaltog/vim-powerline>`_
- `NERDTree <https://github.com/scrooloose/nerdtree>`_
- `Gundo <https://github.com/sjl/gundo.vim/>`_
- `TabMan <https://github.com/kien/tabman.vim>`_
- `PythonMode <https://github.com/klen/python-mode>`_
- `FuzzyFinder <https://github.com/vim-scripts/FuzzyFinder>`_
- `CtrlP <http://kien.github.com/ctrlp.vim/>`_
