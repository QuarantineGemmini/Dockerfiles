
FROM centos:7 

RUN yum groupinstall -y "Development tools"
RUN yum install -y curl 
RUN yum install -y gmp-devel mpfr-devel libmpc-devel zlib-devel vim git java java-devel
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo
RUN yum install -y sbt texinfo gengetopt
RUN yum install -y expat-devel libusb1-devel ncurses-devel cmake "perl(ExtUtils::MakeMaker)"
# deps for poky
RUN yum install -y python36 patch diffstat texi2html texinfo subversion chrpath git wget
# deps for qemu
RUN yum install -y gtk3-devel
# deps for firemarshal
RUN yum install -y python36-pip python36-devel rsync libguestfs-tools makeinfo expat ctags
# Install GNU make 4.x (needed to cross-compile glibc 2.28+)
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8-make
# install DTC
RUN yum install -y dtc

# install git > 2.0
RUN yum remove -y git*
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y git2u-all


