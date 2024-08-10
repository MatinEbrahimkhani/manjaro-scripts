#!/bin/bash
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.10.5
pyenv global 3.10.5
pip install --user pipenv
echo "Python environment set up with pyenv and pipenv."
