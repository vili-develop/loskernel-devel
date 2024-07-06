export PATH=/zfsdata/build/prebuilts_clang_host_linux-x86/r522817/bin:${PATH}
rm -rf out
make mrproper
make SHELL="sh -e" ARCH=arm64 LLVM=1 LLVM_IAS=1 O=out mrproper
make SHELL="sh -e" ARCH=arm64 LLVM=1 LLVM_IAS=1 HOSTCC="ccache clang -target x86_64-unknown-linux-gnu"  O=out  -j$(nproc) vili_defconfig
make SHELL="sh -e" ARCH=arm64 LLVM=1 LLVM_IAS=1 HOSTCC="ccache clang -target x86_64-unknown-linux-gnu"  O=out -j$(nproc) 2>&1 | tee build.log
#mv ./out/arch/arm64/boot/Image ./out/arch/arm64/boot/kernel
# cp ./out/arch/arm64/boot/kernel /mnt/e/Android_Backups/boot_editor_v14r1/build/unzip_boot/
