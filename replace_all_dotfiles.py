r"""
/!\ Dangerous script, need adjustment /!\

Script to copy all dotfiles in "$HOME/". In general, this means that dotfiles
already present in "$HOME/" will be replaced.

TODO: check if shutil is something that you really need, maybe os is enough.
TODO: maybe ask before replacing file in home.
"""

from pathlib import Path
import os
import shutil


home_dir = Path(os.environ['HOME'])
dotfiles_dir = Path()
assert dotfiles_dir.resolve().name == 'dotfiles'

all_dotfiles = [
    x for x in Path().iterdir() if not x.is_dir() and str(x).startswith('.')
]

num_characters = max((len(dotfile.name) for dotfile in all_dotfiles))

for num, dotfile in enumerate(all_dotfiles):
    new_dotfile_path = dotfile.resolve().as_posix()
    old_dotfile_path = (home_dir / dotfile.name).as_posix()
    backup_old_dotfile_path = (
        home_dir / (dotfile.name + '.backup')
    ).as_posix()
    print('({:02d}) {:>{}} has been backed up in {:>{}}.'.format(
        num + 1,
        dotfile.name,
        num_characters,
        backup_old_dotfile_path,
        num_characters,
    ))
    shutil.copyfile(old_dotfile_path, backup_old_dotfile_path)
    print('{:>{}} has been updated with {:>{}}.'.format(
        dotfile.name,
        num_characters + 5,
        new_dotfile_path,
        num_characters,
    ))
    shutil.copyfile(new_dotfile_path, old_dotfile_path)

