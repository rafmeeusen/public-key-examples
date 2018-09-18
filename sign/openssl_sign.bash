PRIVKEYDIR=../output
PUBKEYDIR=../output
INFILE=../output/inputdata.dgst.sha256.bin
OUTDIR=../output

printf "Generate signatures, and verify immediately after.\n"
for algo in rsa ec; do
    privkey=$PRIVKEYDIR/privkey.$algo.pem
    sigfile=$OUTDIR/inputdata.signature.$algo
    echo Using private key file: $privkey
    echo Signing to: $sigfile
    openssl pkeyutl -sign -in $INFILE -inkey $privkey -out $sigfile
    pubkey=$PUBKEYDIR/pubkey.$algo.pem
    echo Verifying with key $pubkey
    openssl pkeyutl -verify -in $INFILE -pubin -inkey $pubkey -sigfile $sigfile
done


