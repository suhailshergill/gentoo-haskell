# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Lenses"
HOMEPAGE="http://github.com/roconnor/data-lens-fd/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/comonad-transformers-2.0[profile?]
		<dev-haskell/comonad-transformers-2.2[profile?]
		>=dev-haskell/data-lens-2.0[profile?]
		<dev-haskell/data-lens-2.11[profile?]
		>=dev-haskell/mtl-2.0.1.0[profile?]
		<=dev-haskell/mtl-2.2[profile?]
		>=dev-haskell/transformers-0.2[profile?]
		<dev-haskell/transformers-0.4[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
