# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="Glob"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Globbing library"
HOMEPAGE="http://iki.fi/matti.niemenmaa/glob/"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-haskell/dlist-0*[profile?]
		>=dev-haskell/transformers-0.2[profile?]
		<dev-haskell/transformers-0.4[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -e 's@transformers == 0.2.\*@transformers >= 0.2 \&\& < 0.4@' \
		-i "${S}/${MY_PN}.cabal" || die "Could not loosen dependencies"
}
