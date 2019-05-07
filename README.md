<!---
 =========================================================================
 *  Filename   : README.md
 *  Author     : mitchell
 *  Description: README for dotfiles project
 *  Last Update: Tue 07 May 2019 09:10:19 PM CEST
 =========================================================================
-->

# Development environment and dotfiles
This repo will contain all kind of files for my personal development
environment. I'm a big fan of dotfiles. Dotfiles allow you to customize
your nerdery. Customize my configuration, settings, look and behavior of my
most important toolset. It's fun! Take anything you want, but at your own
risk. This repo involve mainly:

* VIM as editor
* Git as SCM
* Bash as shell

## Description
* Dotfiles : Vim, Git, Bash, Python, other like tkdiff
* Scripts  : Multiple scripts
* Templates: Templates for multiple languages

## The top-level directory layout
    dotfiles
    |-- vim
        |-- vimrc
        |-- wordlist.vim
        |-- abbrev.vim
        |-- explore.vim
        |-- last_update.vim
        |-- sessions.vim
        |-- digraph_info.vim
        |-- functions.vim
        |-- settings.vim
        |-- colorscheme.vim
        |-- autogroups.vim
        |-- maps.vim
        |-- function_mappings.vim
        |-- templates
            |--template.md
            |--template.bash
            |--template.py
            |--template.awk
            |--template.c
            |--template.cpp
            |--template.sed
            |--template.sh
    |-- git
        |-- gitattributes
        |-- gitignore
        |-- gitmessage
        |-- git-credentials
        |-- gitconfig
        |-- hooks
           |-- pre-push
           |-- pre-commit
           |-- commit-msg
    |-- shell
        |-- bashrc
        |-- xinputrc
        |-- inputrc
        |-- bash_logout
        |-- profile
        |-- bash_profile
        |-- bash_info
        |-- bash_color
        |-- bash_git
        |-- Xresources
        |-- bash_config
        |-- dircolors
        |-- bash_prompt
        |-- bash_functions
        |-- tcsh
            |-- colors.csh
            |-- prompt.csh
            |-- prompt_extra.csh
    |-- python
        |-- pylintrc
    |-- tkdiffrc
    |-- libs
       |-SHELL
       |-AWK
    |-- scripts
        |-- md-prev
        |-- markdown.css
    |-- LICENSE
    |-- README.md

## Getting Started
TODO: Deployment script

## Making Local Customizations
You can make local customizations for some programs by editing these files:

* `vim` : `~/.vimrc_local`
* `bash`: `~/.bash_local`
* `git` : `~/.gitconfig_local`

## Contributing
 1. Fork it!
 2. Create your feature branch: `git checkout -b my-new-feature`
 3. Commit your changes: `git commit -am 'Add some feature'`
 4. Push to the branch: `git push origin my-new-feature`
 5. Create new pull request

## Authors

[@Mitchell Slotboom](https://www.linkedin.com/in/mitchellslotboom/)

## License

This repo is licensed under the MIT License - see the LICENSE.md file for details
