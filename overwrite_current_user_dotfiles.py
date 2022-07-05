from pathlib import Path
import os
import subprocess
import shutil


home_dir = Path(os.environ['HOME'])
dotfiles_dir = Path()
assert dotfiles_dir.resolve().name == 'dotfiles'

all_dotfiles = [
    x for x in Path().iterdir() if not x.is_dir() and str(x).startswith('.')
]

for num, dotfile in enumerate(all_dotfiles):
    new_dotfile = dotfile.resolve().as_posix()
    old_dotfile = (home_dir / dotfile.name).as_posix()
    print('({}) {:>10} has been updated.'.format(num + 1, dotfile.name))
    shutil.copyfile(new_dotfile, old_dotfile)

