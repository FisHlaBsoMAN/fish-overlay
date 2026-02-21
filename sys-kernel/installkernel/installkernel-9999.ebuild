API=8

DESCRIPTION="Dummy package for installkernel"
HOMEPAGE="https://wiki.gentoo.org/wiki/Custom_Kernel"
S="${WORKDIR}"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86" # Добавьте нужные архитектуры

IUSE=""
DEPEND=""
RDEPEND=""

src_unpack() { :; }
src_compile() { :; }
src_install() { :; }
