# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.17

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Tools for using markdown in a yesod application"
HOMEPAGE="http://github.com/pbrisbin/yesod-markdown"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=app-text/pandoc-1.9*[profile?]
		=dev-haskell/blaze-html-0.4*[profile?]
		=dev-haskell/hamlet-1.0*[profile?]
		=dev-haskell/persistent-0.9*[profile?]
		=dev-haskell/text-0.11*[profile?]
		>=dev-haskell/xss-sanitize-0.3.1[profile?]
		<dev-haskell/xss-sanitize-0.4[profile?]
		=dev-haskell/yesod-core-1.0*[profile?]
		=dev-haskell/yesod-form-1.0*[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
