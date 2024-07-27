#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import os
from pathlib import PurePath
from typing import Callable


def main():
    current_script_dir = os.path.dirname(os.path.realpath(__file__))

    # (dot_root_dir) -> (title, [(message, content)])
    # (dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]
    MODULES: list[Callable[[str], tuple[str, list[tuple[str, str]]]]] = [
        vim,
        git,
        inputrc,
        bash,
        starship,
        powershell,
    ]

    for module in MODULES:
        (title, instructions) = module(current_script_dir)
        print("\n\n\n", end="")
        print(f">>> {title} <<<")
        for message, content in instructions:
            print()
            print(message)
            print(f"```\n{content}\n```")
        print()
    print("\n\n\n", end="")


def vim(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    vimrc_d_path = PurePath(dot_root_dir).joinpath("home", ".vimrc.d")

    basic = vimrc_d_path.joinpath("basic.vim")
    with_pm = vimrc_d_path.joinpath("with_pm.vim")
    without_pm = vimrc_d_path.joinpath("without_pm.vim")

    source_command = "source {}"
    vimrc_path = "${HOME}/.vimrc"
    autoload_path = "${HOME}/.vim/autoload"

    return (
        "vim",
        [
            (
                f"put this line at the beginning of your `{vimrc_path}`",
                source_command.format(basic),
            ),
            (
                f"choose one of the following two lines to put in your `{vimrc_path}`",
                "{}\n{}".format(source_command.format(without_pm), source_command.format(with_pm)),
            ),
            ("if you chose `with_pm`, create this folder:", autoload_path),
            (
                "and put `plug.vim` in it (download from the link below)",
                "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
            ),
        ],
    )


def git(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    prefix = PurePath(dot_root_dir).joinpath("home")
    gitconfig = prefix.joinpath("_.gitconfig")
    return (
        "git",
        [
            (
                "put the following content at the beginning of your `${HOME}/.gitconfig`",
                "\n".join(["[include]", f"    path = {gitconfig}"]),
            )
        ],
    )


def inputrc(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    inputrc_d_path = PurePath(dot_root_dir).joinpath("home.linux", ".inputrc.d")
    contents = [
        "$include {}".format(inputrc_d_path.joinpath(content)) for content in ["completion"]
    ]
    return (
        "[linux] inputrc",
        [("put the following content in your `${HOME}/.inputrc`", "\n".join(contents))],
    )


def bash(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    prompt_path = PurePath(dot_root_dir).joinpath(
        "home.linux", ".bashrc.d", "prompt", "starship.sh"
    )
    bashrc_d_path = PurePath(dot_root_dir).joinpath(
        "home.{linux{,.{debian,suse}},wsl}", ".bashrc.d"
    )
    return (
        "[linux] bash",
        [
            (
                "put the following content in your `${HOME}/.bashrc` (modify the expansion pattern accordingly to your distro)",
                "\n".join(
                    [
                        f"source {prompt_path}",
                        f"for f in {bashrc_d_path}/*.sh ; do",
                        "    source ${f};",
                        "done",
                    ]
                ),
            )
        ],
    )


def starship(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    starship_toml_path = PurePath(dot_root_dir).joinpath("home", ".config", "starship.toml")
    symlink_command = f"ln --verbose --symbolic {starship_toml_path} ${{HOME}}/.config/"
    return ("starship", [("execute the following command to make a symlink", symlink_command)])


def powershell(dot_root_dir: str) -> tuple[str, list[tuple[str, str]]]:
    suffix = ["Documents", "WindowsPowerShell", "Microsoft.PowerShell_profile.ps1"]
    source_path = PurePath(dot_root_dir).joinpath("home.windows", *suffix)
    profile_path = PurePath("${HOME}").joinpath(*suffix)
    return (
        "[windows] powershell",
        [
            (
                f"put the following content in your `{profile_path}` (given by the `$profile` variable)",
                f". {source_path}",
            )
        ],
    )


if __name__ == "__main__":
    main()
