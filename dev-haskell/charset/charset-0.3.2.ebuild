# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit base haskell-cabal

DESCRIPTION="Fast unicode character sets based on complemented PATRICIA tries"
HOMEPAGE="http://github.com/ekmett/charset"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/semigroups-0.8.3.1[profile?]
		<dev-haskell/semigroups-0.9[profile?]
		>=dev-haskell/unordered-containers-0.1.4.6[profile?]
		<dev-haskell/unordered-containers-0.3[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

PATCHES=("${FILESDIR}/${PN}-0.3.2-ghc-7.5.patch")
