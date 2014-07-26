
global:
	wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
	tar -zxvf ctags-5.8.tar.gz
	cd ctags-5.8; ./configure
	make && sudo make install

	wget http://tamacom.com/global/global-6.3.tar.gz
	tar -zxvf global-6.3.tar.gz
	cd global-6.3; ./configure --prefix=/usr/local --with-exuberant-ctags=/usr/local/bin/ctags
	make && sudo make install

	sudo yum -y install python-pygments

	git clone https://github.com/yoshizow/global-pygments-plugin.git
	cd global-pygments-plugin; sh reconf.sh; ./configure --prefix=/usr/local --with-exuberant-ctags=/usr/local/bin/ctags
	make && make install
	cp global-pygments-plugin/sample.globalrc $HOME/.globalrc


all:
	touch custom.el
