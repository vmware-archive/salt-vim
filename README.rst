===================================
Vim files for working on Salt files
===================================

Installation
============

Using the Pathogen Plugin Manager
---------------------------------

The recommended method is to use
`Pathogen <https://github.com/tpope/vim-pathogen>`_.
Install Pathogen as described
`here <https://github.com/tpope/vim-pathogen#installation>`_,
then do:

::

    cd ~/.vim/bundle && \
    git clone https://github.com/saltstack/salt-vim.git

Using the Vundle Plugin Manager
-------------------------------

See
`Vundle <https://github.com/gmarik/vundle>`_.

Manual Method #1:
-----------------

::

    git clone https://github.com/saltstack/salt-vim.git
    cd salt-vim && \
    cp -r ftdetect ftplugin syntax  ~/.vim/

Manual Method #2:
-----------------

Alternately, files can be copied into any other directory where Vim looks for
its runtime files, like ``/etc/vim/``. The command ``:set runtimepath`` will
show all such paths. Read ``:help runtimepath`` for more info.

For all installation methods:
-----------------------------

You will also need to specify the following settings in your ``~/.vimrc``:

.. code-block:: vim

    syntax on
    set nocompatible
    filetype plugin indent on

Note: It's possible you may be presented with an error stating something
similar to:

"E319: Sorry, the command is not available in this version: filetype plugin
indent on"

If you get this, specify the following settings in your ``~/.vimrc`` instead:

.. code-block:: vim

    syntax on
    set nocompatible
    set tabstop=2
    set shiftwidth=2
    set expandtab

Too slow?
=========

Note that the default yaml highlighting that ships with vim is very slow with
long lines (e.g., ssh keys, or certificates). You might want to switch to a
faster yaml highlighter, like `vim-yaml <https://github.com/stephpy/vim-yaml>`_.

Configuration
=============

By default, the syntax file will search for the existence of a Jinja syntax
file (as described in the `Jinja docs`_ or via a `Vim bundle`_) in the
``runtimepath``, and load that if found. If it is not found, the Django
template syntax file (which is slightly different, but bundled with Vim) will
be used. You can force using either syntax file using the global variable
``g:sls_use_jinja_syntax``. If it is set, autodetection will be turned off.

.. _Jinja docs: http://jinja.pocoo.org/docs/integration/#vim
.. _Vim bundle: https://github.com/Glench/Vim-Jinja2-Syntax

Valid values:

``0``
    Use the Django syntax file.

``1``
    Use the Jinja syntax file, regardless of whether it exists or not.

Example section of ``~/.vimrc``:

.. code-block:: vim

    " Force using the Django template syntax file
    let g:sls_use_jinja_syntax = 0

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
    Detect SLS files by the file extension ``.sls``, and ``Saltfile`` files by
    an exact filename match.

Other VIM plugins you might find interesting
============================================

- `Powerline <https://github.com/Lokaltog/vim-powerline>`_
- `NERDTree <https://github.com/scrooloose/nerdtree>`_
- `Gundo <https://github.com/sjl/gundo.vim/>`_
- `TabMan <https://github.com/kien/tabman.vim>`_
- `PythonMode <https://github.com/klen/python-mode>`_
- `FuzzyFinder <https://github.com/vim-scripts/FuzzyFinder>`_
- `CtrlP <http://kien.github.com/ctrlp.vim/>`_
