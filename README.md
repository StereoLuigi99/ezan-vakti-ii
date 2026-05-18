# ezan-vakti-ii
illogical-impulse dotfile'ı için ezan vakti widget uygulaması
```
git clone https://github.com/StereoLuigi99/ezan-vakti-ii
cd ezan-vakti-ii
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
