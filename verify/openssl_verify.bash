OUTDIR=../output

CERT=$OUTDIR/root.rsa.pem

printf "Verifying self-signed cert $CERT.\n"
openssl verify -check_ss_sig -CAfile $CERT $CERT

