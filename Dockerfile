FROM mooxe/base:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN \
  # update
  apt-get update && \
  apt-get update && \
  apt-get upgrade -y && \

  apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm && \

  # python pip
  apt-get install -y python-pip && \
#   mkdir -p ~/.pip && \
#   echo "\
# [global]
# index-url = http://mirrors.aliyun.com/pypi/simple/
#   " >> ~/.pip/pip.conf && \
  pip install --upgrade pip && \
  # update all packages
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1 \
  | xargs -n1 pip install -U && \
  pip install pip-tools virtualenv && \
  # pyenv
  git clone git://github.com/yyuu/pyenv.git .pyenv && \
  # pip install --egg pyenv && \
  # pyenv - bash
  echo "\
export PATH=\"\$HOME/.pyenv/bin:\$PATH\"
eval \"\$(pyenv init -)\"
eval \"\$(pyenv virtualenv-init -)\"
  " >> ~/.bash_profile && \
  # pyenv - zsh
  echo "\
export PATH=\"\$HOME/.pyenv/bin:\$PATH\"
eval \"\$(pyenv init -)\"
eval \"\$(pyenv virtualenv-init -)\"
  " >> ~/.zshrc && \
  # pyenv - fish
  echo "\
set PATH \$HOME/.pyenv/bin \$PATH
pyenv init - | .
pyenv virtualenv-init - | .
  " >> ~/.config/fish/config.fish && \
  # pyenv install

  fish -lc 'pyenv install 2.7.10; pyenv install 3.4.3'
