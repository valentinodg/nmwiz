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
ifndef MUTT_DATA_PREFIX
	MUTT_DATA_PREFIX = ${HOME}/.config/mutt/data
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
	echo "checking existence of $(BIN_PREFIX)"
	if [ ! -d "$(BIN_PREFIX)" ]; then mkdir -p "$(BIN_PREFIX)"; fi
	echo "checking existence of $(MUTT_PREFIX)"
	if [ ! -d "$(MUTT_PREFIX)" ]; then mkdir -p "$(MUTT_PREFIX)"; fi
	echo "checking existence of $(MUTT_SHARE_PREFIX)"
	if [ ! -d "$(MUTT_SHARE_PREFIX)" ]; then mkdir -p "$(MUTT_SHARE_PREFIX)"; fi
	echo "checking existence of $(MUTT_DATA_PREFIX)"
	if [ ! -d "$(MUTT_DATA_PREFIX)" ]; then mkdir -p "$(MUTT_DATA_PREFIX)"; fi
	echo "checking existence of $(MSMTP_PREFIX)"
	if [ ! -d "$(MSMTP_PREFIX)" ]; then mkdir -p "$(MSMTP_PREFIX)"; fi
	echo "checking existence of $(MBSYNC_PREFIX)"
	if [ ! -d "$(MBSYNC_PREFIX)" ]; then mkdir -p "$(MBSYNC_PREFIX)"; fi
	echo "checking existence of $(CACHE_PREFIX)"
	if [ ! -d "$(CACHE_PREFIX)" ]; then mkdir -p "$(CACHE_PREFIX)"; fi
	echo "copying files to $(BIN_PREFIX)"
	for file in bin/*; do cp -f $$file $(BIN_PREFIX); done
	echo "copying files to $(MUTT_DATA_PREFIX)"
	for file in data/*; do cp -f $$file $(MUTT_DATA_PREFIX); done
	echo "copying files to $(MUTT_SHARE_PREFIX)"
	for file in share/*; do cp -f $$file $(MUTT_SHARE_PREFIX); done

uninstall:
	echo "removing files from $(BIN_PREFIX)"
	for file in bin/*; do rm -f $(BIN_PREFIX)/$$(basename $(notdir $$file)); done
	echo "removing files from $(MUTT_DATA_PREFIX)"
	for file in data/*; do rm -f $(MUTT_DATA_PREFIX)/$$(basename $(notdir $$file)); done
	echo "removing files from $(MUTT_SHARE_PREFIX)"
	for file in share/*; do rm -f $(MUTT_SHARE_PREFIX)/$$(basename $(notdir $$file)); done
	
.PHONY: install uninstall
