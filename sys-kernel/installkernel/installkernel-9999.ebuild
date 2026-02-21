EAPI=8

DESCRIPTION="Dummy package for installkernel"
HOMEPAGE="https://wiki.gentoo.org/wiki/Custom_Kernel"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="**"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/doc/${PF}
	echo "installkernel fuck you" > "${T}/README.dummy"
	doins "${T}/README.dummy"
}
