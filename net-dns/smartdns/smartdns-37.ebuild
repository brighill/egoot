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
S="${WORKDIR}/smartdns-Release$PV"
src_install() {
	dobin src/smartdns

	insinto /etc/smartdns
	doins etc/smartdns/smartdns.conf

	insinto /etc/default
	doins etc/default/smartdns

	newinitd "${FILESDIR}/smartdns.initd" smartdns 
	systemd_dounit systemd/smartdns.service
 }
