#!/bin/bash

sehirlist() {
    curl -s "https://ezanvakti.emushaf.net/sehirler/2" | jq 'map(del(.SehirAdiEn))'
}

ilcelist() {
    curl -s "https://ezanvakti.emushaf.net/ilceler/$1" | jq 'map(del(.IlceAdiEn))'
}

vakitlist() {
    datenow=$(date +%d.%m.%Y)
    curl -s "https://ezanvakti.emushaf.net/vakitler/$1" | jq --arg bugun "$datenow" '.[] | select(.MiladiTarihKisa == $bugun)'
}

if [ "$1" = "--sehirlist" ]; then
    sehirlist
fi

if [ "$1" = "--ilcelist" ]; then
    ilcelist "$2"
fi

if [ "$1" = "--vakitlist" ]; then
    vakitlist "$2"
fi

if [ "$1" = "--help" -o "$1" = "" ]; then
    echo "--sehirlist            -   Şehirleri listeler"
    echo "--ilcelist {SehirID}   -   Şehrin ilçelerini listeler"
    echo "--vakitlist {IlceID}   -   İlçenin bugünkü ezan vakitlerini listeler"
    echo ""
    echo "Örnek: --sehirlist => SehirID'den istediğinizi seçin (İstanbul: 539)"
    echo "Örnek: --ilcelist 539 => İstanbul'daki IlceID'lerden istediğinizi seçin (Merkez: 9541)"
    echo "Örnek: --vakitlist 9541 => İstanbul/Merkez için bugünkü ezan vakitleri"
    echo ""
fi