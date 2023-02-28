![GitHub repo size](https://img.shields.io/github/repo-size/Hi-Windom/jupyter-binder-python?logo=github&style=flat-square) [![Build Binder Container & Gen Release](https://github.com/Hi-Windom/jupyter-binder-python/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/Hi-Windom/jupyter-binder-python/actions/workflows/ci.yaml) [![Docker](https://img.shields.io/badge/Docker-585899?logo=docker&style=flat-square)](https://hub.docker.com/repository/docker/soltus/jupyter-binder-python) ![Docker Pulls](https://img.shields.io/docker/pulls/soltus/jupyter-binder-python?style=flat-square) ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/soltus/jupyter-binder-python?style=flat-square)

# 简介

此仓库托管在 [Github](https://github.com/Hi-Windom/jupyter-binder-python) ，是一八六战略二期工程项目，绛亽新学习融创示范项目

姊妹仓库：[jupyter-binder](https://github.com/Hi-Windom/jupyter-binder) 额外提供更多 Lab 插件、常用 Python 包以及多个扩展内核

此仓库的 issues 已关闭，转  [jupyter-binder issues label=python](https://github.com/Hi-Windom/jupyter-binder/issues?q=is%3Aopen+is%3Aissue+label%3A%F0%9F%A7%A9Python)

其开源贡献包括两大方面：

1. 提供一个开箱即用的在线 Jupyter Lab 环境
2. 本地快速搭建 Jupyter Lab 环境，包括基础环境与扩展环境

# 使用

## 在 [Binder (mybinder.org)](https://mybinder.org/) 使用

打开链接 [快速开始](https://mybinder.org/v2/gh/Hi-Windom/jupyter-binder-python/HEAD?urlpath=lab/tree/binder.ipynb)

假如你有一个远端仓库（比如 Github），使用 [克隆 ](https://mybinder.org/v2/gh/Hi-Windom/jupyter-binder-python/HEAD?urlpath=lab/tree/loader.ipynb)链接；如果只是想运行单个文件，直接从本地上传是最好的选择

~~任意 ipynb 公开仓库可 [在线生成链接](https://hub.jupyter.org/nbgitpuller/link?tab=binder) ，而无需提供额外配置~~（暂不可用，故障排查中）

基于 Binder 实现，可以在 `Dockerfile` 中 `FROM soltus/jupyter-binder-python:latest` 开始构建自定义的环境镜像

## 在 Windows 本地复苏

作者很懒，这里什么也没写

# 初始化工作

作者很懒，这里什么也没写
