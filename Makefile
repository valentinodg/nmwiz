.POSIX:

OS = $(shell uname -s)
ifndef BIN_PREFIX
	BIN_PREFIX = ${HOME}/.local/bin
endif
ifndef MUTT_PREFIX
	MUTT_PREFIX = ${HOME}/.config/mutt
endif
ifndef MSMTP_PREFIX
	MSMTP_PREFIX = ${HOME}/.config/msmtp
endif
ifndef MBSYNC_PREFIX
	MBSYNC_PREFIX = ${HOME}/.config/mbsync
endif
ifndef MAIL_PREFIX
	MAIL_PREFIX = ${HOME}/.local/share/mail
endif
ifndef CACHE_PREFIX
	CACHE_PREFIX = ${HOME}/.cache/nmwiz
endif

install:
	@echo "install"

uninstall:
	@echo "uninstall"
	
.PHONY: install uninstall
