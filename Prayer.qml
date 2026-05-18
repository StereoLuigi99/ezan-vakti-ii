pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick
import QtPositioning

import qs.modules.common

Singleton {
    id: root
    readonly property int fetchInterval: 10 * 60 * 1000

    property var data: ({
        hcrkisa: 0,
        hcruzun: 0,
        milkisa: 0,
        miluzun: 0,
        imsak: 0,
        gunes: 0,
        ogle: 0,
        ikindi: 0,
        aksam: 0,
        yatsi: 0,
    })

    function refineData(data) {
        let vakit = {};
        vakit.hcrkisa = data?.HicriTarihKisa || "";
        vakit.hcruzun = data?.HicriTarihUzun || "";
        vakit.milkisa = data?.MiladiTarihKisa || "";
        vakit.miluzun = data?.MiladiTarihUzun || "";
        vakit.imsak = data?.Imsak || "";
        vakit.gunes = data?.Gunes || "";
        vakit.ogle = data?.Ogle || "";
        vakit.ikindi = data?.Ikindi || "";
        vakit.aksam = data?.Aksam || "";
        vakit.yatsi = data?.Yatsi || "";
        vakit.lastRefresh = DateTime.time + " • " + DateTime.date;
        root.data = vakit;
    }

    function getData() {
        // Bu bağlantıdaki son sayıyı (IlceID) bulmak için vakitler.sh scriptini kullanın.
        // ./vakitler.sh --sehirlist => SehirID'den istediğinizi seçin (İstanbul: 539)
        // ./vakitler.sh --ilcelist 539 => İstanbul'daki IlceID'lerden istediğinizi seçin (Merkez: 9541)

        // Varsayılan: İstanbul / Merkez

        let IlceID = 9541;
        let command = "curl -s https://ezanvakti.emushaf.net/vakitler/%1".arg(IlceID);
        let date = DateTime.date;
        let dateDotted = date.replace(/\//g, ".");
        console.log(dateDotted);
        
        command += " | ";
        command += 'jq \'.[] | select(.MiladiTarihKisa == "%1")\''.arg(dateDotted);
        console.log(command);
        fetcher.command[2] = command;
        fetcher.running = true;
    }

    Component.onCompleted: {
        root.getData();
    }

    Process {
        id: fetcher
        command: ["bash", "-c", ""]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text.length === 0)
                    return;
                try {
                    const parsedData = JSON.parse(text);
                    root.refineData(parsedData);
                    // console.info(`[ data: ${JSON.stringify(parsedData)}`);
                } catch (e) {
                    console.error(`[PrayerService] ${e.message}`);
                }
            }
        }
    }

    Timer {
        running: true
        repeat: true
        interval: root.fetchInterval
        triggeredOnStart: true
        onTriggered: root.getData()
    }
}