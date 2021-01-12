.POSIX:

OS = $(shell uname -s)
MAKEFLAGS+=-s

ifndef BIN_PREFIX
	BIN_PREFIX = ${HOME}/.local/bin
endif

ifndef MUTT_PREFIX
	MUTT_PREFIX = ${HOME}/.config/mutt
endif
ifndef MUTT_SHARE_PREFIX
	MUTT_SHARE_PREFIX = ${HOME}/.config/mutt/share
endif
ifndef MUTT_ACC_PREFIX
	MUTT_ACC_PREFIX = ${HOME}/.config/mutt/acc
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
	echo "[ CHECK ] exist | mkdir -> $(BIN_PREFIX)"
	if [ ! -d "$(BIN_PREFIX)" ]; then mkdir -p "$(BIN_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(MUTT_PREFIX)"
	if [ ! -d "$(MUTT_PREFIX)" ]; then mkdir -p "$(MUTT_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(MUTT_SHARE_PREFIX)"
	if [ ! -d "$(MUTT_SHARE_PREFIX)" ]; then mkdir -p "$(MUTT_SHARE_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(MUTT_ACC_PREFIX)"
	if [ ! -d "$(MUTT_ACC_PREFIX)" ]; then mkdir -p "$(MUTT_ACC_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(MSMTP_PREFIX)"
	if [ ! -d "$(MSMTP_PREFIX)" ]; then mkdir -p "$(MSMTP_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(MBSYNC_PREFIX)"
	if [ ! -d "$(MBSYNC_PREFIX)" ]; then mkdir -p "$(MBSYNC_PREFIX)"; fi
	echo "[ CHECK ] exist | mkdir -> $(CACHE_PREFIX)"
	if [ ! -d "$(CACHE_PREFIX)" ]; then mkdir -p "$(CACHE_PREFIX)"; fi
	echo "[ COPY ] files -> $(BIN_PREFIX)"
	for file in bin/*; do \
		cp -f $$file $(BIN_PREFIX); \
		chmod 755 $(BIN_PREFIX)/$$(basename $(notdir $$file)); \
	done
	echo "[ COPY ] files -> $(MUTT_PREFIX)"
	for file in root/*; do \
		cp -f $$file $(MUTT_PREFIX); \
		chmod 644 $(MUTT_PREFIX)/$$(basename $(notdir $$file)); \
	done
	echo "[ COPY ] files -> $(MUTT_SHARE_PREFIX)"
	for file in share/*; do \
		cp -f $$file $(MUTT_SHARE_PREFIX); \
		chmod 644 $(MUTT_SHARE_PREFIX)/$$(basename $(notdir $$file)); \
	done

uninstall:
	echo "[ REMOVE ] files <- $(BIN_PREFIX)"
	for file in bin/*; do rm -f $(BIN_PREFIX)/$$(basename $(notdir $$file)); done
	echo "[ REMOVE ] files <- $(MUTT_PREFIX)"
	for file in root/*; do rm -f $(MUTT_PREFIX)/$$(basename $(notdir $$file)); done
	echo "[ REMOVE ] files <- $(MUTT_SHARE_PREFIX)"
	for file in share/*; do rm -f $(MUTT_SHARE_PREFIX)/$$(basename $(notdir $$file)); done
	echo "[ REMOVE ] cache dirs <- $(CACHE_PREFIX)"
	rm -rf $(CACHE_PREFIX)/* 
	echo "[ REMOVE ] msmtp config <- $(MSMTP_PREFIX)"
	rm -f $(MSMTP_PREFIX)/config
	echo "[ REMOVE ] mbsyncrc <- $(MBSYNC_PREFIX)"
	rm -f $(MBSYNC_PREFIX)/.mbsyncrc
	echo "[ REMOVE ] muttrc <- $(MUTT_PREFIX)"
	rm -f $(MUTT_PREFIX)/muttrc
	echo "[ REMOVE ] acc config files <- $(MUTT_ACC_PREFIX)"
	rm -f $(MUTT_ACC_PREFIX)/* 
	echo "[ REMOVE ] notmuch config file <- $(MUTT_ACC_PREFIX)"
	rm -f ${HOME}/.notmuch-config
	echo "[ REMOVE ] mail dirs <- $(MAIL_PREFIX)"
	rm -rf $(MAIL_PREFIX)/*
	echo "[ ! ] remove accounts password using 'pass rm nmwiz-<account>'"
	
.PHONY: install uninstall
