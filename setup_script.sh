export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade

apt-get install -y curl gnupg2 lsb-release
apt-get install -y clang
apt-get install -y sudo

apt-get install -y make cmake git

git clone https://github.com/plaurent/gnustep-build
cd gnustep-build/ubuntu-20.04-clang-10.0-runtime-2.0/
./GNUstep-buildon-ubuntu2004.sh

apt-get install -y libssl-dev
apt-get install -y wget

cd /
git clone https://github.com/tedzhang2891/class-dump-linux.git
cd class-dump-linux/dependence/include/os/
wget https://raw.githubusercontent.com/mlcldh/appleLibdispatch/refs/heads/master/libdispatch-1008.200.78/libdispatch-1008.200.78/os/linux_base.h

mv /usr/include/x86_64-linux-gnu /usr/include/x86_64-linux-gnu_undefined
  
cd /class-dump-linux/source/
sed -i '/^ADDITIONAL_OBJCFLAGS/ s/$/ -fobjc-runtime=gnustep-2.0/' GNUmakefile_classdump.preamble
sed -i '/^ADDITIONAL_OBJCFLAGS/ s/$/ -fblocks/' GNUmakefile_MachObjC.preamble

sed -i '/^typedef __darwin_mach_port_t mach_port_t;/d' ../dependence/include/sys/_types/_mach_port_t.h

sed -i '22d' ../dependence/include/Block.h

export CC=clang

cp /usr/include/x86_64-linux-gnu_undefined/openssl/opensslconf.h /usr/include/openssl/

cd /class-dump-linux/source/

source /gnustep-build/ubuntu-20.04-clang-10.0-runtime-2.0/GNUstep-build/tools-make/GNUstep.sh
make

cp /class-dump-linux/source/obj/classdump /classdump

