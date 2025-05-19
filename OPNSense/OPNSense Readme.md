Wie man OPNSense tu einer NGFW Nextgen Firewall umfunktioniert
Clamav Virenscanner
Rspamd Gateway + Postfix Relay SSL
Redis als Optimierung
Suricata als Inline Realtime NIPS und Crowsec als log based N/HIPS


Zenarmor generell hat gute OPNSense Guides
https://www.zenarmor.com/docs/network-security-tutorials/opnsense-security-and-hardening-best-practice-guide
https://www.zenarmor.com/docs/network-security-tutorials/how-to-configure-opnsense-firewall-rules

Suricata Detection Algorithm
​Hier ist eine tabellarische Übersicht der fünf Musterprüfer-Algorithmen (Pattern Matcher) in OPNsense IPS (Suricata), bewertet nach Netzwerkbandbreite, Eignung für SOHO- oder große Netzwerke, Speicherverbrauch, Performance und einer kurzen Erklärung des Algorithmus:​
https://de.wikipedia.org/wiki/Aho-Corasick-Algorithmus
Musterprüfer	Netzwerkbandbreite	Eignung für Netzwerke	Speicherverbrauch	Performance	Erklärung des Algorithmus
Standard (Aho-Corasick)	Mittel	SOHO	Mittel	Mittel	Standard-Algorithmus in Suricata; nutzt den Aho-Corasick-Algorithmus für effiziente Mustererkennung.
Aho-Corasick	Mittel	SOHO	Mittel	Mittel	Klassischer Algorithmus zur effizienten Suche mehrerer Muster in Texten; verwendet Zustandsautomaten.
Aho-Corasick (reduzierter Speicher)	Mittel	SOHO	Niedrig	Gering	Variante mit reduziertem Speicherbedarf; kann jedoch die Verarbeitungsgeschwindigkeit beeinträchtigen.
Aho-Corasick "Ken Steele" Variante	Mittel	SOHO	Niedrig	Gering	Optimierte Variante für AMD-Systeme; reduziert den Speicherverbrauch, kann jedoch die Leistung beeinträchtigen.
Hyperscan	Hoch	Große Netzwerke	Hoch	Hoch	Hochleistungsfähiger Algorithmus von Intel; nutzt moderne CPU-Instruktionen für schnelle Mustererkennung; erfordert jedoch mehr Speicher.
Empfehlung für kleine Netzwerke (SOHO):

Für kleine Netzwerke empfiehlt sich die Verwendung der Aho-Corasick "Ken Steele" Variante, insbesondere wenn der Speicherverbrauch eine Rolle spielt und die Hardware auf AMD-Prozessoren basiert. ​

Hinweis:

Die Auswahl des geeigneten Musterprüfers hängt von der spezifischen Hardware und den Leistungsanforderungen ab. Es wird empfohlen, verschiedene Optionen zu testen, um die optimale Balance zwischen Leistung und Ressourcenverbrauch für Ihr Netzwerk zu finden.

OPNSense Bugs (Issues zur Not aufmachen mit Github):
Unbound DNS Internal DNS Server löst nicht auf bei DNS Rewrites
WireGuard funktioniert nicht sauber Site-to-Site als Single-Peer (nur ein User) und Multi-Peer (mehrere Interfaces mit verschieden Usern)
DenyAll blockt viel und soll als letztes und eigene Regeln heben das nicht auf
SFTP Backup Private Key crypto error
Alias wird nicht richtig erkannt