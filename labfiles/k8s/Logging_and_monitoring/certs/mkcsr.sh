#!/bin/bash

for instance in master1 worker1 worker2 worker3; do
cat > ${instance}-csr.json <<EOF
{
  "CN": "system:node:${instance}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
     "C": "HU",
     "L": "Budapest",
     "O": "system:nodes",
     "OU": "KBS-10x lab",
     "ST": "Budapest"
    }
  ]
}
EOF
done

