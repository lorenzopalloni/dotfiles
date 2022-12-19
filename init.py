r"""
Copies all dotfiles in "$HOME/".

This means that dotfiles already present in "$HOME/" will be replaced.
"""

import shutil
from argparse import ArgumentParser
from pathlib import Path


def parse_args():
    """Argument parser."""
    parser = ArgumentParser()
    parser.add_argument("--input_dir", "-i", default=Path(), type=Path)
    parser.add_argument("--output_dir", "-o", default=Path.home(), type=Path)
    return parser.parse_args()


def copy_safely(src: Path, dst: Path) -> None:
    """Copy `src` to `dst` asking always for permission.

    Args:
        src (Path): source file pathname
        dst (Path): destination file pathname
    """
    print(f"I'm going to copy {src} to {dst}.")
    ans = input("May I have your permission? [y/N]")
    trues = ("y", "yes", "1")
    falses = ("n", "no", "0", "")
    if ans.lower() in trues:
        shutil.copyfile(src, dst)
    elif ans.lower() in falses:
        return None
    else:
        return copy_safely(src, dst)
    return None


def copy_all_dotfiles_safely(input_dir: Path, output_dir: Path) -> None:
    """Copy all dotfiles in `input_dir` to `output_dir`.

    Args:
        src (Path): source directory pathname
        dst (Path): destination directory pathname
    """
    print(f"input_dir: {input_dir}")
    print(f"output_dir: {output_dir}")

    assert (
        input_dir.resolve().name == "dotfiles"
    ), "Please, provided an `input_dir` that is the dotfiles repo path."

    excluded = [".gitignore"]
    all_dotfiles = [
        x
        for x in input_dir.iterdir()
        if (
            not x.is_dir()
            and str(x).startswith(".")
            and x.name not in excluded
        )
    ]

    for i, new in enumerate(all_dotfiles, start=1):
        print(f"[ {i} / {len(all_dotfiles)} ]")
        old = output_dir / new.name
        backup = output_dir / (new.name + ".backup")
        if backup.exists():
            print(f"Warning: A backup file for {new.name} already exists.")
        copy_safely(old, backup)
        copy_safely(new.absolute(), old)


def main():
    """Parse user-provided arguments and copy all dotfiles safely."""
    args = parse_args()
    copy_all_dotfiles_safely(
        input_dir=args.input_dir, output_dir=args.output_dir
    )


if __name__ == "__main__":
    main()
