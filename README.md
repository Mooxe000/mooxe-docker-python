# mooxe-docker-python

docker image for python of mooxe

## repo addr

  * [pip](https://github.com/pypa/pip)
  * [pyenv](https://github.com/yyuu/pyenv)
  * [pip-tools](https://github.com/nvie/pip-tools)
  * [virtualenv](https://github.com/pypa/virtualenv)
  * [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv)

## pyenv

```bash
# list versions canbe install
pyenv install -l
# list installed versions
pyenv versions
# set global version
pyenv global ${version}
# set local version
pyenv local ${version}
```

## pyenv-virtualenv

```bash
# on bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# on fish
pyenv init - | source
pyenv virtualenv-init - | source
# activate
pyenv activate venv27
# de-activate
pyenv deactivate venv27
# alias versions
pyenv virtualenv venv27
pyenv virtualenv venv34
# list pyenv virtualenvs
pyenv virtualenvs
```

## virtualenv

```bash
virtualenv .venv
# bash
. .venv/bin/activate
# fish
. .venv/bin/activate.fish
# out
pyenv deactivate .venv
```

## requirement

```bash
# save
pip freeze > requirement.txt
# load
pip install -r requirement.txt
```

## pip-tools

```bash
pip-compile requirements.in
mkdir ./wheelhouse
pip wheel -r requirements.txt -w ./wheelhouse/
pip install --use-wheel --no-index --find-links=./wheelhouse/ -r requirements.txt
```

## 参考资料

* [Python 程序的发布流程](http://www.nosa.me/2015/07/11/python-%E7%A8%8B%E5%BA%8F%E7%9A%84%E5%8F%91%E5%B8%83%E6%B5%81%E7%A8%8B/)
* [python模块介绍-locustio：性能测试工具locustio中文文档](http://my.oschina.net/u/1433482/blog/464092)
* [[转] Python 负载测试工具 Locust](https://testerhome.com/topics/2888)
