FROM golang:latest

RUN apt -y update && \
    apt -y install neovim && \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    mkdir -p ~/.config/nvim && \
    touch ~/.config/nvim/init.vim && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    go get -u golang.org/x/tools/cmd/gopls

COPY ./init.vim /root/.config/nvim/init.vim

RUN vim +PluginInstall +qall