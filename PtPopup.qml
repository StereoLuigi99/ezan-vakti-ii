import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.ii.bar.weather

import QtQuick
import QtQuick.Layouts
import qs.modules.ii.bar

StyledPopup {
    id: root

    ColumnLayout {
        id: columnLayout
        anchors.centerIn: parent
        implicitWidth: Math.max(header.implicitWidth, gridLayout.implicitWidth)
        implicitHeight: gridLayout.implicitHeight
        spacing: 5

        // Header
        ColumnLayout {
            id: header
            Layout.alignment: Qt.AlignHCenter
            spacing: 2

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 6

                MaterialSymbol {
                    fill: 0
                    font.weight: Font.Medium
                    text: "🕌"
                    iconSize: Appearance.font.pixelSize.large
                    color: Appearance.colors.colOnSurfaceVariant
                }

                StyledText {
                    text: "Ezan Vakti"
                    font {
                        weight: Font.Medium
                        pixelSize: Appearance.font.pixelSize.normal
                    }
                    color: Appearance.colors.colOnSurfaceVariant
                }
            }
            StyledText {
                Layout.alignment: Qt.AlignHCenter
                id: temp
                font.pixelSize: Appearance.font.pixelSize.smaller
                color: Appearance.colors.colOnSurfaceVariant
                text: Prayer.data.hcruzun
            }
        }

        GridLayout {
            id: gridLayout
            columns: 2
            rowSpacing: 5
            columnSpacing: 5
            uniformCellWidths: true

            WeatherCard {
                title: "İmsak"
                symbol: "wb_twilight_2"
                value: Prayer.data.imsak
            }
            WeatherCard {
                title: "Güneş"
                symbol: "wb_twilight"
                value: Prayer.data.gunes
            }
            WeatherCard {
                title: "Öğle"
                symbol: "clear_day"
                value: Prayer.data.ogle
            }
            WeatherCard {
                title: "İkindi"
                symbol: "partly_cloudy_day"
                value: Prayer.data.ikindi
            }
            WeatherCard {
                title: "Akşam"
                symbol: "partly_cloudy_night"
                value: Prayer.data.aksam
            }
            WeatherCard {
                title: "Yatsı"
                symbol: "bedtime"
                value: Prayer.data.yatsi
            }
        }

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            text: "Güncellik: %1".arg(Prayer.data.lastRefresh)
            font {
                weight: Font.Medium
                pixelSize: Appearance.font.pixelSize.smaller
            }
            color: Appearance.colors.colOnSurfaceVariant
        }
    }
}
