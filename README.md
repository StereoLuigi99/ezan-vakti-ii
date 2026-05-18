# ezan-vakti-ii
illogical-impulse dotfile'ı için ezan vakti widget uygulaması
```
git clone https://github.com/StereoLuigi99/ezan-vakti-ii
cd ezan-vakti-ii
```
Prayer.qml dosyasındaki IlceID sayısını kendinize göre değiştirin.
Bunun için vakitler.sh scriptini kullanabilirsiniz.
```
chmod +x vakitler.sh
./vakitler.sh --sehirlist => SehirID'den istediğinizi seçin (İstanbul: 539)
./vakitler.sh --ilcelist 539 => İstanbul'daki IlceID'lerden istediğinizi seçin (Merkez: 9541)
```
Prayer.qml
```
function getData() {
    ...
    let IlceID = 9528; <== BU DEĞERİ DEĞİŞTİRMELİSİNİZ
    ...
}
```
```
cp Prayer.qml ~/.config/quickshell/ii/services/
cp PtPopup.qml ~/.config/quickshell/ii/modules/ii/bar/
cp PtIndicator.qml ~/.config/quickshell/ii/modules/ii/bar/
```
Aynı zamanda ~/.config/quickshell/ii/modules/ii/bar/BarContent.qml'in sonuna, Weather yorumlu bölümün altına şu bölümü ekleyin:
```
Loader {
    Layout.leftMargin: 10
    active: true

    sourceComponent: BarGroup {
        PtIndicator {}
    }
}
```
