# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools git-2

MY_PN="window_merge"
DESCRIPTION="A Pidgin plugin that merges the Buddy List window with a conversation window"
HOMEPAGE="https://github.com/dm0-/window_merge"

EGIT_REPO_URI="git://github.com/dm0-/${MY_PN}.git"
EGIT_BRANCH="master"
EGIT_COMMIT="d8a8ce335f01f6b60de9302c74d33fed2f1ba5b2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/libtool"

src_prepare(){
	sed -e "/ACLOCAL_AMFLAGS/d" -i Makefile.am || die
	eautoreconf
}
src_install(){
	emake install DESTDIR="${D}"
	dodoc AUTHORS BUGS ChangeLog NEWS README TODO
}
