#!/bin/sh
# Script to install build-time dependencies for Wine.
# If your distro isn't supported here, please add it.
# Home page (until accepted into wine tree): http://winezeug.googlecode.com
# Copyright 2006-2011 Dan Kegel
# Copyright 2008-2013 Austin English
# Please report bugs to http://code.google.com/p/winezeug/issues/list
# LGPL

if test "`lsb_release -i -r -s`" = "CentOS 5.8" || test "`lsb_release -i -r -s`" = "CentOS 6.2"
then
    set -e
    set -x
    echo "If you haven't already, please add the EPEL repository; see http://fedoraproject.org/wiki/EPEL"
    echo "Also, you might want to add the El Repo repository; see http://elrepo.org/"
    echo "Then you can e.g. install nvidia drivers with:"
    echo 'yum install libXvMC; yum --disablerepo=\* --enablerepo=elrepo install kmod-nvidia nvidia-x11-drv  nvidia-x11-drv-32bit'

centos_pkgs="\
SDL-devel \
Xaw3d-devel \
alsa-lib-devel \
audiofile-devel \
autoconf \
bison \
bzip2-devel \
cups-devel \
curl-devel \
cyrus-sasl-devel \
dbus-devel \
desktop-file-utils \
e2fsprogs-devel \
esound-devel \
expat-devel \
flex \
fontconfig-devel \
fontforge \
freeglut-devel \
freetype-devel \
fuse-devel \
gcc \
gd-devel \
giflib-devel \
glibc-devel \
glut-devel \
gmp-devel \
gnutls-devel \
gphoto2-devel \
gstreamer-devel \
hal-devel \
icoutils \
isdn4k-utils-devel \
kernel-devel \
keyutils-libs-devel \
krb5-devel \
lcms-devel \
libICE-devel \
libSM-devel \
libX11-devel \
libXScrnSaver-devel \
libXau-devel \
libXaw-devel \
libXcomposite-devel \
libXcursor-devel \
libXdamage-devel \
libXdmcp-devel \
libXevie-devel \
libXext-devel \
libXfixes-devel \
libXfont-devel \
libXft-devel \
libXi-devel \
libXinerama-devel \
libXmu-devel \
libXpm-devel \
libXrandr-devel \
libXrender-devel \
libXres-devel \
libXt-devel \
libXtst-devel \
libXv-devel \
libXvMC-devel \
libXxf86dga-devel \
libXxf86misc-devel \
libXxf86vm-devel \
libdrm-devel \
libfontenc-devel \
libgcrypt-devel \
libgpg-error-devel \
libidn-devel \
libieee1284-devel \
libjpeg-devel \
libmng-devel \
libpng-devel \
libselinux-devel \
libsepol-devel \
libstdc++-devel \
libtiff-devel \
libusb-devel \
libxml2-devel \
libxslt-devel \
lzma \
mesa-libGL-devel \
mesa-libGLU-devel \
mpg123-devel \
ncurses-devel \
netpbm-devel \
openldap-devel \
openssl-devel \
pkgconfig \
prelink \
pulseaudio-libs-devel \
sane-backends-devel \
unixODBC-devel \
xorg-x11-proto-devel \
xorg-x11-xtrans-devel \
zlib-devel \
"

centos_5_pkgs="\
gcc44 \
libXTrap-devel \
libXfontcache-devel \
"

centos_5_pkgs_64="\
bzip2-devel.i386 \
elf*.i386 \
glibc-devel.i386 \
gmp-devel.i386 \
libstdc++-devel.i386 \
libX*-devel.i386 \
libX*.i386 \
lua.i386 \
mesa*-devel.i386 \
tolua++.i386 \
zlib-devel.i386 \
"

centos_6_pkgs_64="\
alsa-lib-devel.i686 \
audiofile-devel.i686 \
bzip2-devel.i686 \
cups-devel.i686 \
cyrus-sasl-devel.i686 \
dbus-devel.i686 \
e2fsprogs-devel.i686 \
elf*.i686 \
esound-devel.i686 \
expat-devel.i686 \
fontconfig-devel.i686 \
freetype-devel.i686 \
fuse-devel.i686 \
gd-devel.i686 \
giflib-devel.i686 \
glibc-devel.i686 \
gmp-devel.i686 \
gnutls-devel.i686 \
gstreamer-devel.i686 \
hal-devel.i686 \
isdn4k-utils-devel.i686 \
keyutils-libs-devel.i686 \
krb5-devel.i686 \
lcms-devel.i686 \
libdrm-devel.i686 \
libfontenc-devel.i686 \
libgcrypt-devel.i686 \
libgpg-error-devel.i686 \
libICE-devel.i686 \
libidn-devel.i686 \
libieee1284-devel.i686 \
libjpeg-devel.i686 \
libmng-devel.i686 \
libpng-devel.i686 \
libsepol-devel.i686 \
libSM-devel.i686 \
libstdc++-devel.i686 \
libtiff-devel.i686 \
libusb-devel.i686 \
libX11-devel.i686 \
libXau-devel.i686 \
libXaw-devel.i686 \
libXcomposite-devel.i686 \
libXcursor-devel.i686 \
libXdamage-devel.i686 \
libX*-devel.i686 \
libXdmcp-devel.i686 \
libXevie-devel.i686 \
libXext-devel.i686 \
libXfixes-devel.i686 \
libXfont-devel.i686 \
libXft-devel.i686 \
libX*.i686 \
libXi-devel.i686 \
libxml2-devel.i686 \
libXmu-devel.i686 \
libXpm-devel.i686 \
libXrandr-devel.i686 \
libXrender-devel.i686 \
libXres-devel.i686 \
libXScrnSaver-devel.i686 \
libxslt-devel.i686 \
libXt-devel.i686 \
libXtst-devel.i686 \
libXv-devel.i686 \
libXvMC-devel.i686 \
libXxf86dga-devel.i686 \
libXxf86misc-devel.i686 \
libXxf86vm-devel.i686 \
lua.i686 \
mesa*-devel.i686 \
mesa-libGL-devel.i686 \
mesa-libGLU-devel.i686 \
ncurses-devel.i686 \
netpbm-devel.i686 \
openldap-devel.i686 \
openssl-devel.i686 \
pulseaudio-libs-devel.i686 \
sane-backends-devel.i686 \
SDL-devel.i686 \
unixODBC-devel.i686 \
Xaw3d-devel.i686 \
zlib-devel.i686 \
"

yum -y groupinstall "Development Tools"
yum -y groupinstall "X Window System"
yum -y install $centos_pkgs

case "`lsb_release -i -r -s`" in
*"CentOS 6."*)
    yum -y install $centos_6_pkgs_64
    ;;
*"CentOS 5."*)
    yum -y install $centos_5_pkgs $centos_5_pkgs_64 

    # Some centos 5 packages are too old for wine, so build those
    # from source, and put them in /usr/local/winedeps so they
    # don't clash with the system versions.

    # nettle
    if test ! -f /usr/local/winedeps/lib64/libnettle.a
    then
        wget -c http://www.lysator.liu.se/~nisse/archive/nettle-2.4.tar.gz
        rm -rf nettle-2.4
        tar -xzf nettle-2.4.tar.gz
        cd nettle-2.4
        ./configure prefix=/usr/local/winedeps
        make
        make install
        cd ..
    fi

    # gnutls
    if test ! -f /usr/local/winedeps/lib/libgnutls.a
    then
        wget -c http://ftp.gnu.org/gnu/gnutls/gnutls-3.0.19.tar.xz
        xzcat < gnutls-3.0.19.tar.xz > gnutls-3.0.19.tar
        tar -xf gnutls-3.0.19.tar
        cd gnutls-3.0.19
        ./configure prefix=/usr/local/winedeps CFLAGS="-I/usr/local/winedeps/include -L/usr/local/winedeps/lib64"
        cores=`cat /proc/cpuinfo | grep 'processor' | wc -l`
        cores=`expr $cores - 1`
        make -j$cores
        make install
        cd ..
    fi

    # flex
    if test ! -f /usr/local/winedeps/bin/flex
    then
        wget -c 'http://prdownloads.sourceforge.net/flex/flex-2.5.35.tar.bz2?download'
        tar -xjf flex-2.5.35.tar.bz2
        cd flex-2.5.35
        ./configure prefix=/usr/local/winedeps
        make
        make install
        cd ..
    fi
    ;;
esac

echo 'Now configure and build wine with e.g.'
echo 'PATH=/usr/local/winedeps/bin:$PATH'
echo 'export PATH'
echo 'cd $HOME'
echo 'mkdir wine64'
echo 'cd wine64'
echo '../wine-git/configure --enable-win64 CC=gcc44 CFLAGS="-L/usr/local/winedeps/lib -I/usr/local/winedeps/include -g -O2"'
echo 'make'
echo 'cd $HOME'
echo 'mkdir wine32'
echo 'cd wine32'
echo '../wine-git/configure --with-wine64=../wine64 CC=gcc44'
echo 'make'

    exit

fi

# OpenSolaris stuff...

if test `uname -o` = Solaris
then
    if test ! -w /
    then
        echo "Usage: pfexec sh $0"
        exit 1
    fi

    if test ! `which pkg`
    then
        echo "Only OpenSolaris is supported at this time."    
        exit 1
    fi

    pkg install SUNWaconf SUNWaudh SUNWbison SUNWcups SUNWflexlex SUNWgcc SUNWgit \
    SUNWGlib SUNWgmake SUNWgnome-common-devel SUNWsane-backend SUNWxorg-headers SUNWxwinc
    exit
fi

if test `uname -s` = 'FreeBSD'
then
    if test ! -w /
    then
        echo "Usage: 'sh $0' as root"
        exit 1
    fi

    pkg_add -r bison cups flex git gsm gstreamer-plugins jpeg lcms libGLU \
    libxslt mpg123 openldap-client sane-backends tiff xorg
    exit
fi

if test `uname -s` = 'NetBSD'
then
    if test ! -w /
    then
        echo "Usage: 'sh $0' as root"
        exit 1
    fi

    pkg_add bison cups flex gsm jpeg lcms libxslt mpg123 openldap-client sane-backends scmgit-base tiff
    exit
fi

if test `uname -s` = 'OpenBSD'
then
    if test ! -w /
    then
        echo "You must run $0 as root"
        exit 1
    fi

    if test ! $PKG_PATH
    then
        echo "\$PKG_PATH is undefined, don't know where to get packages"
        exit 1
    fi

    for pkg in \
        git \
        lcms \
        gsm \
        openldap-client \
        sane-backends \
        gnutls \
        mpg123 \
        jpeg \
        png \
        libxml \
        libxslt \
        bison
    do
        pkg_add $pkg
    done

    if test -d /usr/ports/devel/flex/
    then
        cd /usr/ports/devel/flex
        make
        make install
    else
        echo "Flex wasn't found in ports (or you don't have ports installed)."
        echo "You'll need to build/install flex manually. You need at least version 2.5.33."
        exit 2
    fi

fi

# Regular Linux distros.

if test ! -w /
then
    echo "Usage: sudo sh $0"
    exit 1
fi

#
# Alpine Linux:
alpine_pkgs="\
alsa-lib-dev autoconf automake bison build-base cups-dev flex fontconfig-dev freetype-dev git gnutls-dev gsm-dev \
gst-plugins-base-dev gstreamer-dev jpeg-dev lcms-dev libgphoto2-dev libpng-dev libxcomposite-dev libxcursor-dev \
libxdamage-dev libxinerama-dev libxml2-dev libxrandr-dev libxrender-dev libxslt-dev libxxf86dga-dev mesa-dev \
mpg123-dev ncurses-dev openal-soft-dev openldap-dev openssl-dev paxctl tiff-dev v4l-utils-dev winbind zlib-dev"

#----------------------------------------------------------------------------
# Debian data, common to Debian GNU/kFreeBSD, GNU/Hurd and GNU/Linux:
debian_common_pkgs="\
bison ccache flex fontforge gcc gettext git-core libasound2-dev libaudio-dev libc6-dev libcups2-dev \
libdbus-1-dev libelfg0 libesd0-dev libexif-dev libexpat1-dev libfontconfig1-dev libfreetype6-dev \
libgcrypt11-dev libgif-dev libgl1-mesa-dev libglib2.0-dev libglu1-mesa-dev libgnutls-dev \
libgpg-error-dev libgphoto2-2-dev libgsm1-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
libhal-dev libhal-storage-dev libice-dev libjpeg62-dev liblcms1-dev libldap2-dev libmad0 libmad0-dev \
libmpg123-dev libncurses5-dev libodbcinstq1c2 libogg-dev  libopenal-dev libopenal1 \
libpng12-dev libpopt-dev libsane-dev libsm-dev libssl-dev libtasn1-3-dev libtiff4-dev libtiffxx0c2 \
libusb-dev libvorbis-dev libvorbisfile3 libx11-dev libxau-dev libxcomposite-dev libxcursor-dev \
libxdmcp-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxinerama-dev libxml2-dev libxmu-dev \
libxmu-headers libxrandr-dev libxrender-dev libxslt1-dev libxt-dev libxv-dev libxxf86vm-dev m4 make \
mesa-common-dev unixodbc unixodbc-dev x11proto-composite-dev x11proto-core-dev x11proto-fixes-dev \
x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-video-dev x11proto-xext-dev \
x11proto-xf86vidmode-dev x11proto-xinerama-dev xtrans-dev zlib1g-dev"

# Linux specific:
debian_linux_pkgs="\
libcapi20-3 libcapi20-dev libieee1284-3-dev linux-libc-dev prelink"

#----------------------------------------------------------------------------
# Ubuntu data
ubuntu_common_pkgs="\
bison ccache cvs flex fontforge gcc gettext git-core libasound2-dev libaudio-dev libc6-dev \
libcapi20-3 libcapi20-dev libdbus-1-dev libesd0-dev libexif-dev \
libexpat1-dev libfontconfig1-dev libfreetype6-dev libgcrypt11-dev libgl1-mesa-dev \
libglib2.0-dev libglu1-mesa-dev libgnutls-dev libgpg-error-dev libgphoto2-2-dev libgsm1-dev libgstreamer0.10-dev \
libgstreamer-plugins-base0.10-dev libice-dev libieee1284-3-dev liblcms1-dev \
libldap2-dev libmad0 libmad0-dev libmpg123-dev libncurses5-dev \
libogg-dev  libopenal-dev libopenal1 libpng12-dev libpopt-dev \
libsm-dev libssl-dev libtasn1-3-dev libusb-dev libvorbis-dev \
libvorbisfile3 libx11-dev libxau-dev libxcomposite-dev libxcursor-dev libxdmcp-dev \
libxext-dev libxfixes-dev libxft-dev libxi-dev libxinerama-dev libxml2-dev libxmu-dev \
libxmu-headers libxrandr-dev libxrender-dev libxslt1-dev libxt-dev libxv-dev \
libxxf86vm-dev linux-libc-dev m4 make mesa-common-dev \
unixodbc unixodbc-dev x11proto-composite-dev x11proto-core-dev x11proto-fixes-dev  \
x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-video-dev x11proto-xext-dev \
x11proto-xf86vidmode-dev x11proto-xinerama-dev xtrans-dev zlib1g-dev \
libelfg0 libgif-dev libjack-dev"

ubuntu_common_1604_pkgs="\
bison ccache cvs flex fontforge gcc gettext git-core libasound2-dev libaudio-dev libc6-dev \
libcapi20-3 libcapi20-dev libdbus-1-dev libesd0-dev libexif-dev \
libexpat1-dev libfontconfig1-dev libfreetype6-dev libgcrypt11-dev libgl1-mesa-dev \
libglib2.0-dev libglu1-mesa-dev libgnutls-dev libgpg-error-dev libgphoto2-dev libgsm1-dev libgstreamer0.10-dev \
libgstreamer-plugins-base0.10-dev libice-dev libieee1284-3-dev liblcms2-dev \
libldap2-dev libmad0 libmad0-dev libmpg123-dev libncurses5-dev \
libogg-dev  libopenal-dev libopenal1 libpng12-dev libpopt-dev \
libsm-dev libssl-dev libtasn1-6-dev libusb-dev libvorbis-dev \
libvorbisfile3 libx11-dev libxau-dev libxcomposite-dev libxcursor-dev libxdmcp-dev \
libxext-dev libxfixes-dev libxft-dev libxi-dev libxinerama-dev libxml2-dev libxmu-dev \
libxmu-headers libxrandr-dev libxrender-dev libxslt1-dev libxt-dev libxv-dev \
libxxf86vm-dev linux-libc-dev m4 make mesa-common-dev \
unixodbc unixodbc-dev x11proto-composite-dev x11proto-core-dev x11proto-fixes-dev  \
x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-video-dev x11proto-xext-dev \
x11proto-xf86vidmode-dev x11proto-xinerama-dev xtrans-dev zlib1g-dev \
libelf1 libgif-dev libjack-dev"

ubuntu_karmic_pkgs="\
libcups2-dev \
libfreebob0 \
libjpeg62-dev \
liblzo2-dev \
libltdl7 \
libltdl7-dev \
libgstreamermm-0.10-dev \
libhal-dev \
libhal-storage-dev-dev \
libodbcinstq1c2 \
libosmesa6-dev \
libsane-dev \
libtiffxx0c2 \
libtiff4-dev \
odbcinst1debian1 \
prelink \
x-dev \
"

ubuntu_maverick_pkgs="\
libcups2-dev \
libfreebob0 \
libjpeg62-dev \
liblzo2-dev \
libltdl7 \
libltdl7-dev \
libgstreamermm-0.10-dev \
libhal-dev \
libhal-storage-dev-dev \
libodbcinstq1c2 \
libosmesa6-dev \
libsane-dev \
libtiffxx0c2 \
libtiff4-dev \
odbcinst \
prelink \
"

ubuntu_precise_pkgs="\
libcups2-dev \
libhal-dev \
libhal-storage-dev-dev \
libjpeg-turbo8-dev \
libosmesa6-dev \
libsane-dev \
libtiffxx0c2 \
libtiff4-dev \
libv4l-dev \
oss4-dev \
prelink \
winbind \
"

ubuntu_trusty_pkgs="\
libcups2-dev \
libjpeg-turbo8-dev \
liblcms2-dev \
libosmesa6-dev \
libsane-dev \
libtiffxx5 \
libtiff5-dev \
libv4l-dev \
oss4-dev \
prelink \
winbind \
"

ubuntu_xenial_pkgs="\
libcups2-dev \
libjpeg-turbo8-dev \
liblcms2-dev \
libosmesa6-dev \
libsane-dev \
libtiffxx5 \
libtiff5-dev \
libv4l-dev \
oss4-dev \
prelink \
winbind \
"

#----------------------------------------------------------------------------
# rpm-based distros

fedora_pkgs="\
alsa-lib-devel audiofile-devel bison cups-devel dbus-devel esound-devel flex \
fontconfig-devel fontforge freeglut-devel freetype-devel gcc giflib-devel git \
gnutls-devel gsm-devel gstreamer-plugins-base-devel isdn4k-utils-devel lcms-devel\
libgphoto2-devel libICE-devel libjpeg-devel libpng-devel libSM-devel libusb-devel \
libv4l-devel libX11-devel libXau-devel libXcomposite-devel libXcursor-devel \
libXext-devel libXi-devel libXinerama-devel libxml2-devel libXrandr-devel libXrender-devel \
libxslt-devel libXt-devel libXv-devel libXxf86vm-devel make mesa-libGL-devel \
mesa-libGLU-devel mesa-libOSMesa-devel ncurses-devel openal-soft-devel openldap-devel \
openssl-devel patch pkgconfig prelink samba-winbind sane-backends-devel xorg-x11-proto-devel"

suse_common_pkgs="\
alsa-devel audiofile bison capi4linux-devel cups-devel desktop-file-utils flex \
fontconfig-devel freeglut-devel freetype2-devel gcc giflib-devel git-core glibc-devel \
libgphoto2-devel liblcms-devel libxml2-devel libxslt-devel make Mesa-devel ncurses-devel \
openldap2-devel unixODBC-devel update-desktop-files xorg-x11-devel zlib-devel"

suse_11_1_pkgs="\
gnutls-devel hal-devel jack-devel libjpeg-devel libpng-devel openssl-devel pkgconfig"

suse_12_2_pkgs="\
libgnutls-devel libjack-devel libjpeg62-devel libopenssl-devel libpng12-compat-devel \
libudev-devel pkg-config"


#----------------------------------------------------------------------------
# Code

# For some reason, Debian/KFreeBSD has this, but it is broken...
case "`uname -s`" in
    *Linux*) lsb_release_path=`which lsb_release 2>/dev/null`;;
esac

if test "$lsb_release_path" != ""
then
  distro=`lsb_release -i -r -s`
elif test -f /etc/issue
  then
    distro=`head -n 1 /etc/issue`
else
  echo "Don't know how to identify your OS."
fi

case $distro in
*Alpine*Linux*) apk add $alpine_pkgs;;
Linux*Mint*18|Ubuntu*16.04) apt-get install $ubuntu_common_1604_pkgs $ubuntu_xenial_pkgs;;
Linux*Mint*17|Ubuntu*14.04) apt-get install $ubuntu_common_pkgs $ubuntu_trusty_pkgs;;
Linux*Mint*13|Ubuntu*12.04) apt-get install $ubuntu_common_pkgs $ubuntu_precise_pkgs;;
Linux*Mint*9|Ubuntu*10.04) apt-get install $ubuntu_common_pkgs $ubuntu_karmic_pkgs;;
Fedora*release*) yum install $fedora_pkgs ;;
SUSE*LINUX*11.1) zypper install $suse_common_pkgs $suse_11_1_pkgs ;;
SUSE*LINUX*12.2) zypper install $suse_common_pkgs $suse_12_2_pkgs ;;
Debian*Hurd*) apt-get install $debian_common_pkgs ;;
Debian*Linux*) apt-get install $debian_common_pkgs $debian_linux_pkgs ;;
Debian*6.0.*) apt-get install $debian_common_pkgs $debian_linux_pkgs ;;
Debian*kFreeBSD*) apt-get install $debian_common_pkgs ;;
*) echo "distro $distro not supported"; exit 1;;
esac

set -x
if test `uname -m` = x86_64
then

# Provide plain old .so names for given libraries
# Usage: linksos dir foo.so.x bar.so.y ...
linksos()
{
    dir=$1
    shift
    for lib
    do
        barename=`echo $lib | sed 's/\.so\..*$/.so/' `
        if test -f $dir/$lib && test ! -f $dir/$barename 
        then
            ln -s $dir/$lib $dir/$barename
        fi
    done
}

    case $distro in
    Fedora*release*)
        yum install alsa-lib-devel.i686 audiofile-devel.i686 cups-devel.i686 dbus-devel.i686 esound-devel.i686 \
            fontconfig-devel.i686 freetype.i686 freetype-devel.i686 giflib-devel.i686 glib2-devel.i686 gsm-devel.i686 \
            gstreamer-devel.i686 gstreamer-plugins-base-devel.i686 hal-devel.i686 \
            lcms-devel.i686 libICE-devel.i686 libjpeg-turbo-devel.i686 libpng-devel.i686 libSM-devel.i686 \
            libusb-devel.i686 libv4l-devel.i686 libX11-devel.i686 libXau-devel.i686 libXcomposite-devel.i686 \
            libXcursor-devel.i686 libXext-devel.i686 libXi-devel.i686 libXinerama-devel.i686 \
            libxml2-devel.i686 libXrandr-devel.i686  libXrender-devel.i686 libxslt-devel.i686 \
            libXt-devel.i686 libXv-devel.i686 libXxf86vm-devel.i686 mesa-libGL-devel.i686 \
            mesa-libGLU-devel.i686 ncurses-devel.i686 openal-soft-devel.i686 openldap-devel.i686 \ 
            openssl-devel.i686 zlib-devel.i686 sane-backends-devel.i686 \
            xorg-x11-proto-devel glibc-devel.i686 prelink libstdc++-devel.i686 pulseaudio-libs-devel.i686 \
            gnutls-devel.i686 libgphoto2-devel.i686 openal-soft-devel.i686 isdn4k-utils-devel.i686 \
            gsm-devel.i686 libv4l-devel.i686 cups-devel.i686 libtiff-devel.i686
        ;;
    Linux*Mint*9|Ubuntu*10.04)
        apt-get install ia32-libs lib32asound2-dev lib32ncurses5-dev lib32v4l-dev lib32z1-dev
        ;;
    *)
        echo "I do not know how to install 32 bit libraries for distro $distro yet"
        ;;
    esac
fi
