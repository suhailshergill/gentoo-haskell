# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="3"
CABAL_FEATURES="bin lib profile haddock hscolour"
inherit haskell-cabal bash-completion

DESCRIPTION="a distributed, interactive, smart revision control system"
HOMEPAGE="http://darcs.net/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~ppc-macos ~x86-macos"
IUSE="doc test"

RDEPEND="=dev-haskell/hashed-storage-0.5*
		=dev-haskell/haskeline-0.6*
		=dev-haskell/html-1.0*
		=dev-haskell/mmap-0.5*
		<dev-haskell/mtl-2.1
		>=dev-haskell/network-2.2
		<dev-haskell/parsec-3.2
		<dev-haskell/regex-compat-0.94
		=dev-haskell/tar-0.3*
		=dev-haskell/terminfo-0.3*
		>=dev-haskell/text-0.11
		<dev-haskell/zlib-0.6.0.0
		>=dev-lang/ghc-6.10.1
		net-misc/curl
		virtual/mta"

# darcs also has a library version; we thus need $DEPEND
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		doc?  ( virtual/latex-base
				dev-tex/latex2html )
		test? ( dev-haskell/test-framework
				dev-haskell/test-framework-hunit
				dev-haskell/test-framework-quickcheck2 )
		"
pkg_setup() {
	if use doc && ! built_with_use -o dev-tex/latex2html png gif; then
		eerror "Building darcs with USE=\"doc\" requires that"
		eerror "dev-tex/latex2html is built with at least one of"
		eerror "USE=\"png\" and USE=\"gif\"."
		die "USE=doc requires dev-tex/latex2html with USE=\"png\" or USE=\"gif\""
	fi
}

src_prepare() {
	cd "${S}"
	if has_version ">=dev-lang/ghc-7.0.1"; then
		epatch "${FILESDIR}/${P}-ghc-7.patch" || die "Could not apply ${P}-ghc-7.patch"
		sed -e 's@containers >= 0.1 && < 0.4@containers >= 0.1 \&\& < 0.5@g' \
			-e 's@directory  == 1.0.\*@directory  == 1.1.\*@g' \
			-e 's@filepath     == 1.1.\*@filepath     == 1.2.\*@g' \
			-i "${S}/${PN}.cabal" || die "Could not patch ${S}/${PN}.cabal to loosen dependencies for ghc 7"
	fi
	if has_version ">=dev-haskell/mtl-2"; then
		epatch "${FILESDIR}/${P}-mtl-2.patch" || die "Could not apply ${P}-mtl-2.patch"
		sed -e 's@mtl          >= 1.0 && < 1.2@mtl          >= 1.0 \&\& < 2.1@g' \
			-i "${S}/${PN}.cabal" || die "Could not patch ${S}/${PN}.cabal to loosen dependencies for mtl 2"
	fi

	cd "${S}/contrib"
	epatch "${FILESDIR}/${PN}-1.0.9-bashcomp.patch"

	# Loosen dependency on parsec
	sed -i -e "s/parsec       >= 2.0 && < 3.1/parsec       >= 2.0/" \
		"${S}/${PN}.cabal" \
		|| die "Could not loosen deps on parsec"

	# and on network
	sed -i -e 's/network == 2\.2\.\*/network >= 2.2/' \
		"${S}/${PN}.cabal"

	# hlint tests tend to break on every newly released hlint
	rm "${S}/tests/haskell_policy.sh"

	# use a more recent API, and thus depend on a more recent package
	sed -i -e "s/findBy/find/" "${S}/src/Darcs/Test/Patch/Info.hs"
}

src_configure() {
	# checking whether ghc supports -threaded flag
	# Beware: http://www.haskell.org/ghc/docs/latest/html/users_guide/options-phases.html#options-linker
	# contains: 'The ability to make a foreign call that does not block all other Haskell threads.'
	# It might have interactivity impact.

	threaded_flag=""
	if $(ghc-getghc) --info | grep "Support SMP" | grep -q "YES"; then
		threaded_flag="--flags=threaded"
		einfo "$P will be built with threads support"
	else
		threaded_flag="--flags=-threaded"
		einfo "$P will be built without threads support"
	fi

	# Use curl for net stuff to avoid strict version dep on HTTP and network
	cabal_src_configure \
		--flags=curl \
		--flags=-http \
		--flags=curl-pipelining \
		--flags=color \
		--flags=terminfo \
		--flags=mmap \
		$threaded_flag \
		$(cabal_flag test)
}

src_test() {
	# run cabal test from haskell-cabal
	haskell-cabal_src_test || die "cabal test failed"

	# run the unit tests (not part of cabal test for some reason...)
	# breaks the cabal abstraction a bit...
	"${S}/dist/build/unit/unit" || die "unit tests failed"
}

src_install() {
	cabal_src_install
	dobashcompletion "${S}/contrib/darcs_completion" "${PN}"

	rm "${ED}/usr/bin/unit" 2> /dev/null

	# fixup perms in such an an awkward way
	mv "${ED}/usr/share/man/man1/darcs.1" "${S}/darcs.1" || die "darcs.1 not found"
	doman "${S}/darcs.1" || die "failed to register darcs.1 as a manpage"

	# if tests were enabled, make sure the unit test driver is deleted
	rm -rf "${ED}/usr/bin/unit"
}

pkg_postinst() {
	ghc-package_pkg_postinst
	bash-completion_pkg_postinst

	ewarn "NOTE: in order for the darcs send command to work properly,"
	ewarn "you must properly configure your mail transport agent to relay"
	ewarn "outgoing mail.  For example, if you are using ssmtp, please edit"
	ewarn "${EPREFIX}/etc/ssmtp/ssmtp.conf with appropriate values for your site."
}
