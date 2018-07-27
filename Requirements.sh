clear
echo 'Descargar Android Studio: https://developer.android.com/studio/'
read -p 'Presiona enter para continuar...'

echo $'\n''Installing flutter'$'\n'
sudo tar xf Downloads/flutter_linux_v0.5.1-beta.tar.xz
sudo chmod -R 777 flutter/
sudo mv flutter/ Documents/
echo 'Descargar Android Studio: https://developer.android.com/studio/'
read -p 'Presiona enter para continuar...'
echo 'export PATH="Documents/flutter/bin/:$PATH"' >> .profile
source ~/.profile
echo $'\n''Path actualizado'$'\n'
sleep 3 && clear
flutter doctor

read -p 'Presiona enter si ya se descargó Android Studio para continuar...'
unzip Downloads/android-studio-ide-173.4819257-linux.zip && mv android-studio/ Downloads/
sudo cp -r Downloads/android-studio /usr/local/
if [ `uname -m` == 'x86_64' ]; then
  sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
fi
cd /usr/local/android-studio/bin/
sudo chmod 777 studio.sh
read -p $'\n''Pulsa enter para instalar IntelliJ...'
sudo snap install intellij-idea-community --classic --edge
echo $'\n''IntelliJ Instalado :)'
sleep 3 && clear
sudo apt install cpu-checker
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo modprobe kvm-intel
sudo adduser $USER kvm
sudo chown $USER /dev/kvm
kvm-ok
./studio.sh