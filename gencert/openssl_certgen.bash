OUTDIR=../output
KEYDIR=../output

CERT=$OUTDIR/root.rsa.pem
KEY=$KEYDIR/privkey.rsa.pem

printf "Generating $CERT.\n"
openssl req -x509 -key $KEY -config ../openssl_cfg/rootca.cfg -outform PEM -out $CERT




