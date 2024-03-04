#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def insert_bashrc():
    # # Recommend to put this at the end of user `.bashrc`.
    # path_bashrc='/path/to/file'
    # if [ -f "${path_bashrc}" ] ; then
    #     source "${path_bashrc}"
    # fi
    pass


def insert_inputrc():
    # $include /path/to/file
    pass


def insert_powershell_profile():
    # # The path of PowerShell profiles file is given by the `$profile` variable,
    # # remember to use the actual path on your machine.
    # . /path/to/PowerShell_profile.ps1
    pass


def insert_gitconfig():
    # [include]
    # ; Recommended to put this section at the end of global `.gitconfig`.
    #     path = /path/to/gitconfig
    pass


def insert_vimrc():
    # " Recommended to put this at the end of user `.vimrc`.
    # let path_vimrc = '/path/to/file'
    # if filereadable(path_vimrc)
    #     execute 'source ' . path_vimrc
    # endif
    pass


def main():
    pass


if (__name__ == '__main__'):
    main()
