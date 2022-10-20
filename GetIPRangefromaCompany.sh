#!/bin/bash
Company = ""
curl -s https://networksdb.io/ip-addresses-of/$Company | grep 'IP Range' | awk '{print $3" - "$5}' | sort
