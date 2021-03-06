[![Build Status](https://travis-ci.org/motiejus/toolshed.svg?branch=master)](https://travis-ci.org/motiejus/toolshed)
[![motiejus/toolshed container status](https://images.microbadger.com/badges/image/motiejus/toolshed.svg)](https://microbadger.com/images/motiejus/toolshed "Docker image badger from microbadger.com")

# Toolshed

[motiejus/toolshed](https://hub.docker.com/r/motiejus/toolshed/) is a docker
image with many command-line tools.

Builds a somewhat bootable image from the container and publishes to
[vno1.jakstys.lt/toolsehd/](https://vno1.jakstys.lt/toolshed/).


# Container Usage

Setup:

    $ grep -A3 toolshed ~/.profile
    toolshed() {
        docker run --name toolshed -v `pwd`:/x -w /x -ti --rm motiejus/toolshed "$@"
    }

The above will execute the toolshed with `/x/` mounted as the current directory.

## A few examples

A Bash prompt in a rich environment:

    $ toolshed

View man pages normally not found, say, on osx:

    $ toolshed man strace systemd.unit

In which package does some random file live?

    $ toolshed apt-file search arm-linux-gnueabihf-gcc-7

Inspect an executable in a seemingly disposable environment:

    $ toolshed ldd /x/what_is_this

Compile LaTeX to pdf:

    $ toolshed pdflatex /x/foo.tex

Browse pandas documentation:

    $ docker run -d -w /usr/share/doc/python-pandas-doc/html/ -p 8000:8000 motiejus/toolshed python3 -m http.server
    $ open http://localhost:8000/


Browse Rust stdlib documentation:

    $ docker run -d -w /root/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/share/doc/rust/html -p 8000:8000 motiejus/toolshed python3 -m http.server
    $ open http://localhost:8000/std/index.html

## Bootable image usage

    $ wget https://vno1.jakstys.lt/toolshed/toolshed-....xz
    $ xzcat -v toolshed-*.xz | sudo dd of=/dev/[removable drive] bs=1M

## Notes

* Toolshed contains a reasonable netboot environment. Network setup is an
  exercise to the reader.
* `grep motiejus` in this repo. My public keys are in at least 1 place.
