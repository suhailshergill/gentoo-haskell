# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Default config and main functions for your yesod application"
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-haskell/network-conduit-0.4*[profile?]
		=dev-haskell/shakespeare-css-1.0*[profile?]
		=dev-haskell/shakespeare-js-1.0*[profile?]
		>=dev-haskell/text-0.9[profile?]
		>=dev-haskell/transformers-0.2.2[profile?]
		<dev-haskell/transformers-0.4[profile?]
		dev-haskell/unordered-containers[profile?]
		=dev-haskell/wai-1.2*[profile?]
		=dev-haskell/wai-extra-1.2*[profile?]
		=dev-haskell/warp-1.2*[profile?]
		=dev-haskell/yaml-0.7*[profile?]
		=dev-haskell/yesod-core-1.0*[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
