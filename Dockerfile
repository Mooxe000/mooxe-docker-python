FROM mooxe/base:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN \
  # update
  apt-get update && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get autoremove -y

RUN \
  # python pip
  curl -L https://bootstrap.pypa.io/get-pip.py | python && \

  # apt-get install -y python-pip && \
#   mkdir -p ~/.pip && \
#   echo "\
# [global]
# index-url = http://mirrors.aliyun.com/pypi/simple/
#   " >> ~/.pip/pip.conf && \

  # pip install --upgrade pip && \
  # update all packages
  # pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U

  # pyenv
  # git clone git://github.com/yyuu/pyenv.git .pyenv && \
  # pip install --egg pyenv && \
  curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash && \

  pip install virtualenv

RUN \
  # pyenv - bash
  echo "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"" >> ~/.bashrc && \
  echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc && \
  echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc && \
  # pyenv - zsh
  echo "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"" >> ~/.zshrc && \
  echo "eval \"\$(pyenv init -)\"" >> ~/.zshrc && \
  echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.zshrc && \
  # pyenv - fish
  echo "set PATH \$HOME/.pyenv/bin \$PATH" >> ~/.config/fish/config.fish && \
  echo "pyenv init - | ." >> ~/.config/fish/config.fish && \
  echo "pyenv virtualenv-init - | ." >> ~/.config/fish/config.fish

RUN \
  apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm && \
  # pyenv install
  fish -lc 'pyenv install 2.7.10; pyenv install 3.4.3' && \
  fish -lc 'pyenv versions' && \
  # 2.7.10
  fish -lc 'pyenv local 2.7.10' && \
  fish -lc 'pip install --upgrade pip' && \
  fish -lc 'pip install pip-tools virtualenv' && \
  fish -lc 'pyenv virtualenv venv27' && \
  # 3.4.3
  fish -lc 'pyenv local 3.4.3' && \
  fish -lc 'pip install --upgrade pip' && \
  fish -lc 'pip install pip-tools virtualenv' && \
  fish -lc 'pyenv virtualenv venv34' && \
  # use system
  fish -lc 'pyenv virtualenvs' && \
  fish -lc 'pyenv local system' && \
  fish -lc 'pyenv versions'
