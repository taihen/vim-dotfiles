#.vim configuration files: Taihen Vim Distribution

This is a distribution of vim plugins and tools intended to be run on top of VIM. It is a good starting point for anyone intending to use VIM for development.
Targeted for current latest version (8.2).

##Manual installation:

	cd ~
	git clone https://github.com/taihen/vimfiles.git .vim
	ln -s .vim/vimrc .vimrc
	cd ~/.vim
	git submodule sync
	git submodule update --init --recursive

##Updating to the latest version:

	cd ~/.vim
	git pull
	git submodule sync
	git submodule update --init --recursive

##Defined keyboard shortcuts

###With leader (,)

	par - text formating
	W - write file as root
	d - go to definitions (lsp)
	c - go to documentation (lsp)
	f - format code (lsp)
	o - hoover definitions (lsp)
	se - enable English spellcheck
	sp - enable Polish spellcheck
	sd - disable spellcheck
	l - toggle hidden characters
	i - toggle paste
	/ - search highlight
	F - toggle FZF
	t - new buffer
	x - close buffer
	n - previous buffer
	m - next buffer
	a= - allign (tabular)
	a> - allign (tabular)
	a: - allign (tabular)
	v - edit vimrc
	ss - strip whitespaces
	sk - strip e-mail signature
	y - remote copy using osc51

###Without leader
	<esc>s - quick file save
	<space> - toggle folding

