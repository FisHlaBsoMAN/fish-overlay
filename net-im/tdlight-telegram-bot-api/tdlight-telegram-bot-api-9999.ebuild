# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake systemd

#TD_COMMIT="7eba19887ad834fd731b6b07b53c2426fe4beb59"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tdlight-team/tdlight-telegram-bot-api.git"
	EGIT_SUBMODULES=( td )
else
	SRC_URI="https://github.com/tdlight-team/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" td? ( https://github.com/tdlib/td/archive/${TD_COMMIT}.zip -> td-${TD_COMMIT}.zip )"

	KEYWORDS="~amd64"
fi

DESCRIPTION="telegram bot api server"
HOMEPAGE="https://tdlight-team.github.io/tdlight-telegram-bot-api/"

LICENSE="BSL"
SLOT="0"
IUSE="
	+td
"
REQUIRED_USE="
	
"

BDEPEND="
	
	
"
DEPEND="
	dev-util/cmake:=
	
"
RDEPEND="${DEPEND}"

src_unpack() {
	default

	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	fi
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	CMAKE_INSTALL_PREFIX=/usr/local	
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/lib64/
	# отвратительно. я не хочу так
	doins ../${PN}-${PV}_build/td/libtdapi.so.1.8.10
	doins ../${PN}-${PV}_build/td/libtdapi.so
	systemd_dounit "${FILESDIR}"/tdlight-bot-api.service
}

