#!/bin/bash

for instance in master1 worker1 worker2 worker3
do
  IP=$(grep ${instance} /etc/hosts | awk '{print $1}')
  cfssl gencert   -ca=/etc/kubernetes/pki/ca.crt \
     -ca-key=/etc/kubernetes/pki/ca.key  \
     -config=ca-config.json   \
     -hostname=${instance},${IP}   \
     -profile=kubernetes   \
     ${instance}-csr.json | cfssljson -bare ${instance}
done

