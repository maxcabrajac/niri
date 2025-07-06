buildroot=/
_bindir=usr/bin
_datadir=usr/share
_userunitdir=etc/systemd/user

build:
	cargo build --release

install:
	install -Dm755 -t $(buildroot)$(_bindir) ./target/release/niri
	install -Dm755 -t $(buildroot)$(_bindir) ./resources/niri-session
	install -Dm644 -t $(buildroot)$(_datadir)/wayland-sessions ./resources/niri.desktop
	install -Dm644 -t $(buildroot)$(_datadir)/xdg-desktop-portal ./resources/niri-portals.conf
	install -Dm644 -t $(buildroot)$(_userunitdir) ./resources/niri.service
	install -Dm644 -t $(buildroot)$(_userunitdir) ./resources/niri-shutdown.target
