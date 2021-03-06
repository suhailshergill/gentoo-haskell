# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit base haskell-cabal

DESCRIPTION="Certificates and Key Reader/Writer"
HOMEPAGE="http://github.com/vincenthz/hs-certificate"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/asn1-data-0.6.1.3[profile?]
		<dev-haskell/asn1-data-0.7[profile?]
		=dev-haskell/crypto-pubkey-types-0.1*[profile?]
		dev-haskell/mtl[profile?]
		=dev-haskell/pem-0.1*[profile?]
		dev-haskell/time[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

PATCHES=("${FILESDIR}/${PN}-1.2.3-ghc-7.5.patch")
