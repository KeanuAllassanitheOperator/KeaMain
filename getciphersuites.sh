#!/bin/bash
# Sinnvoll um die aktuellen Cipher Suites sich ausgeben zu lassen, die auf dem jeweiligen Linux Host unterstützt werden. Bspw. wenn dieser als Mail oder Webserver fungiert und ein Client Probleme hat die Website aufzurufen oder der Client aufgrund der Aktualisierung neuerer Cipher Suites bei Outlook oder Thunderbird es zu einem TLS-Mismatch kommt beim Handshake, da man sich nicht auf die gleichen verwendenten Algorithmen einigen konnte
/usr/bin/openssl ciphers -v | cut -d" " -f1
