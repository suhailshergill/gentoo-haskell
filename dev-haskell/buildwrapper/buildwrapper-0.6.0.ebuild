# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A library and an executable that provide an easy API for a Haskell IDE"
HOMEPAGE="https://github.com/JPMoresmau/BuildWrapper"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test" # hang for me
IUSE=""

RDEPEND=">=dev-haskell/aeson-0.4[profile?]
		dev-haskell/attoparsec[profile?]
		dev-haskell/cabal[profile?]
		dev-haskell/cmdargs[profile?]
		dev-haskell/cpphs[profile?]
		dev-haskell/ghc-paths[profile?]
		dev-haskell/haskell-src-exts[profile?]
		dev-haskell/mtl[profile?]
		dev-haskell/regex-tdfa[profile?]
		dev-haskell/syb[profile?]
		dev-haskell/text[profile?]
		dev-haskell/transformers[profile?]
		dev-haskell/unordered-containers[profile?]
		dev-haskell/utf8-string[profile?]
		>=dev-haskell/vector-0.8[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		test? ( dev-haskell/hunit
			dev-haskell/test-framework
			dev-haskell/test-framework-hunit
		)
		>=dev-haskell/cabal-1.8"
