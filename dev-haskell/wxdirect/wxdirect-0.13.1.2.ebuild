# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

CABAL_FEATURES="bin lib profile haddock hscolour hoogle"
inherit haskell-cabal

DESCRIPTION="helper tool for building wxHaskell"
HOMEPAGE="http://haskell.org/haskellwiki/WxHaskell"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/parsec-2.1.0[profile?]
		<dev-haskell/strict-1.0[profile?]
		>=dev-haskell/time-1.0[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"
