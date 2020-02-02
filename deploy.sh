#!/bin/bash

ln -si `pwd`/dot_bashrc ${HOME}/.bashrc
ln -si `pwd`/dot_vimrc ${HOME}/.vimrc
if [ -d ${HOME}/.config/nvim/ ]; then ln -si `pwd`/dot_config_nvim_init.vim ${HOME}/.config/nvim/init.vim; fi
ln -si `pwd`/dot_tmux.conf ${HOME}/.tmux.conf
ln -si `pwd`/dot_ssh_config ${HOME}/.ssh/config
