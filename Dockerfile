# kernel list https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

FROM golang:1.20.1-bullseye as GO
# debian env
RUN go env
# RUN find / -type f -name "go"

FROM jupyter/base-notebook:python-3.9.13 as JUPYTER
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER} NB_UID=${NB_UID}
ENV HOME=/home/${NB_USER}
# FROM 包含了创建 jovyan 用户
# from=JUPYTER 已存在 jovyan 用户
# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}
USER root
COPY --from=GO /go /go
COPY --from=GO /usr/local/go /usr/local/go
ENV GOVERSION="go1.20.1" GCCGO="gccgo" GOENV=/home/${NB_USER}/.config/go/env GOROOT=/usr/local/go GOPATH=/go GOMODCACHE=/go/pkg/mod GOTOOLDIR=/usr/local/go/pkg/tool/linux_amd64
# PATH 单列项
ENV PATH=$PATH:/usr/local/go/bin/:/go/bin/
# jupyter GO kernel
RUN go install github.com/janpfeifer/gonb@latest \
&& go install golang.org/x/tools/cmd/goimports@latest \
&& go install golang.org/x/tools/gopls@latest \
&& gonb --install
COPY . /home/${NB_USER}
COPY environment.yml /tmp/environment.yml
RUN sudo rm -rf environment.yml \
&& sudo rm -rf /home/${NB_USER}/work
# 删除 jupyter/scipy-notebook 引入的文件夹 work
#
RUN mamba env update -n base --file /tmp/environment.yml \
  && mamba clean -yaf
#
# Encountered problems while solving by manba ! need pip
# ignore warn, can not work if use sudo -H
RUN pip install digautoprofiler -q \
&& pip install jupyter-wysiwyg -q \
&& pip install nbtools -q
#
# nbgitpuller 用于内容仓库与环境仓库分离
# 暂不可用 https://github.com/jupyterhub/nbgitpuller/issues/292
# RUN pip install nbgitpuller -q
#
# auto run initial work
RUN nbdime config-git --enable --global \
&& conda init
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}