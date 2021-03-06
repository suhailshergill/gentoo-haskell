# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.17

EAPI=4

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Present the module dependencies of a program as a .dot graph."
HOMEPAGE="http://github.com/yav/graphmod"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2
		>=dev-haskell/dotgen-0.2
		<dev-haskell/dotgen-0.5
		dev-haskell/haskell-lexer
		>=dev-lang/ghc-6.10.1"
