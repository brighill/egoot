# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="A local DNS server to obtain the fastest website IP for the best Internet experience."
HOMEPAGE="https://github.com/pymumu/smartdns"

MY_PV=Release${PV}
S=${WORKDIR}/smartdns-${MY_PV}

SRC_URI="
    https://github.com/pymumu/smartdns/archive/${MY_PV}.tar.gz -> smartdns-${MY_PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}
src_compile() {
	cd smartdns-Release$PV
	make clean
	make VER=$pkgver SBINDIR=/usr/bin RUNSTATEDIR=/run
}

src_install() {
	insinto /usr/lib/smartdns
	doins src/smartdns
	fperms 0755 /usr/lib/smartdns/smartdns

	dosym  /usr/lib/smartdns/smartdns /usr/bin/smartdns

	insinto /etc/smartdns
	doins etc/smartdns/smartdns.conf

	insinto /etc/default
	doins etc/default/smartdns

	doinitd etc/init.d/smartdns
	systemd_dounit systemd/smartdns.service
 }
