# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin"
inherit haskell-cabal bash-completion eutils

DESCRIPTION="The command-line interface for Cabal and Hackage."
HOMEPAGE="http://www.haskell.org/cabal/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc64 ~sparc ~x86"
IUSE="+noprefs"

RDEPEND=">=dev-haskell/cabal-1.10.1
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/http-4000.0.2 <dev-haskell/http-4000.3
		dev-haskell/network
		>=dev-haskell/time-1.1
		=dev-haskell/zlib-0.5*"

src_prepare() {
	if use noprefs; then
		epatch "${FILESDIR}/${PN}"-0.8-nopref.patch
	fi
	epatch "${FILESDIR}/${PN}"-0.10-ghc-7.2.patch
}

src_install() {
	haskell-cabal_src_install

	dobashcompletion "${S}/bash-completion/cabal"
}

pkg_postinst() {
	ghc-package_pkg_postinst

	bash-completion_pkg_postinst
}