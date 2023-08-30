#!/bin/bash

cat out/arch/arm64/boot/dts/vendor/qcom/kona-v2.1.dtb \
    out/arch/arm64/boot/dts/vendor/qcom/kona-v2.dtb \
    out/arch/arm64/boot/dts/vendor/qcom/kona.dtb \
    > out/arch/arm64/boot/dtb

if [ -f out/arch/arm64/boot/Image ]; then
    cp -f out/arch/arm64/boot/dtb release/
    if [ -f out/arch/arm64/boot/Image.gz ]; then
        cp -f out/arch/arm64/boot/Image.gz release/
    else
        cp -f out/arch/arm64/boot/Image release/
    fi
    find out -type f -name "*.ko" -exec cp -Rf "{}" release/modules/system/vendor/lib/modules/ \;
    
    cd release
    zip -r9 "Windstation.zip" * -x *.DS_Store .git* README.md *placeholder LICENSE
    cd ../
fi