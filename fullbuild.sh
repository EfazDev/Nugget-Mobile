git clone --branch master --recurse-submodules https://github.com/theos/theos theos
rm theos/sdks/.keep
git clone --branch master https://github.com/theos/sdks theos/sdks

cd theos/sdks
git checkout iPhoneOS16.5.sdk
cd ../..
brew install coreutils make xz ldid
export THEOS="$(pwd)/theos"

git submodule update --init
bash get_libraries.sh
bash ipabuild.sh

mkdir -p build
mv *.ipa build/
zip -r artifact.zip build