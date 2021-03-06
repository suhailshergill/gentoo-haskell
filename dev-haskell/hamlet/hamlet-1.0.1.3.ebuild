# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit base haskell-cabal

DESCRIPTION="Haml-like template files that are compile-time checked"
HOMEPAGE="http://www.yesodweb.com/book/shakespearean-templates"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2[profile?]
		<dev-haskell/blaze-builder-0.4[profile?]
		=dev-haskell/blaze-html-0.5*[profile?]
		>=dev-haskell/blaze-markup-0.5.1[profile?]
		<dev-haskell/blaze-markup-0.6[profile?]
		>=dev-haskell/failure-0.1[profile?]
		<dev-haskell/failure-0.3[profile?]
		>=dev-haskell/parsec-2[profile?]
		<dev-haskell/parsec-4[profile?]
		=dev-haskell/shakespeare-1.0*[profile?]
		>=dev-haskell/text-0.7[profile?]
		<dev-haskell/text-0.12[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/cabal-1.10
			   =dev-haskell/hspec-1.1*[profile?]
			   dev-haskell/hunit[profile?]
			   dev-haskell/json-types[profile?]
			   >=dev-haskell/quickcheck-2[profile?]
			   dev-haskell/test-framework[profile?]
			   dev-haskell/test-framework-hunit[profile?]
		)"
