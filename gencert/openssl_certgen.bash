OUTDIR=../output
KEYDIR=../output

CERT=$OUTDIR/root.rsa.pem
KEY=$KEYDIR/privkey.rsa.pem

printf "Generating self-signed $CERT.\n"
openssl req -x509 -key $KEY -config ../openssl_cfg/rootca.cfg -outform PEM -out $CERT -set_serial 0
openssl x509 -in $CERT -text -out $CERT.txt
