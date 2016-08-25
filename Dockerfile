FROM ubuntu:16.04

MAINTAINER Motiejus Jakštys <desired.mta@gmail.com>

RUN apt-get update && apt-get install -y \
    python3 python python-doc python3-doc nmap curl build-essential git git-svn vim \
    bash-completion erlang erlang-doc erlang-manpages python-virtualenv dnsutils \
    lsof strace debootstrap telnet xinetd graphicsmagick iotop tmux \
    htop gdb gdb-doc netcat-openbsd pypy pypy-dev python-dev sloccount cloc pandoc \
    texlive manpages-dev manpages glibc-doc autossh valgrind pastebinit \
    apt-file ruby-dev zsh busybox tree xmlto stl-manual busybox wget \
    python-pygments ipython nodejs npm tsocks golang pdftk sox libsox-fmt-all

RUN apt-file update

RUN curl -fsSL https://recs.pl > /usr/local/bin/recs && chmod +x recs
