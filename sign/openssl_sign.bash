PRIVKEYDIR=../output
PUBKEYDIR=../output
INFILE=../output/inputdata.dgst.sha256.bin
OUTDIR=../output

function set_vars() {
    algo=$1
    privkey=$PRIVKEYDIR/privkey.$algo.pem
    pubkey=$PUBKEYDIR/pubkey.$algo.pem
}

function print_filenames() {
    echo Using private key file: $privkey
    echo Signing to: $sigfile
}


printf "Generate signatures, and verify immediately after.\n"
set_vars "rsa"
printf "RSA PSS (contains randomness)\n"
sigfile=$OUTDIR/inputdata.signature.rsapss
print_filenames
rsaoptions="-pkeyopt rsa_padding_mode:pss -pkeyopt digest:sha256"
# openssl pkeyutl -sign -in ../output/inputdata.dgst.sha256.bin -inkey ../output/privkey.rsa.pem -out ../output/SIGNATURE5.bin -pkeyopt rsa_padding_mode:pss -pkeyopt digest:sha256 -pkeyopt rsa_pss_saltlen:0
openssl pkeyutl -sign -in $INFILE -inkey $privkey -out $sigfile $rsaoptions
echo Verifying with key $pubkey
openssl pkeyutl -verify -in $INFILE -pubin -inkey $pubkey -sigfile $sigfile $rsaoptions

printf "\n"
printf "RSA PKCS1-v1.5 (deterministic)\n"
sigfile=$OUTDIR/inputdata.signature.rsapkcs15
print_filenames
rsaoptions="-pkeyopt digest:sha256"
openssl pkeyutl -sign -in $INFILE -inkey $privkey -out $sigfile $rsaoptions
echo Verifying with key $pubkey
openssl pkeyutl -verify -in $INFILE -pubin -inkey $pubkey -sigfile $sigfile $rsaoptions

printf "\n"
set_vars "ec"
printf "EC\n"
sigfile=$OUTDIR/inputdata.signature.ec
print_filenames
openssl pkeyutl -sign -in $INFILE -inkey $privkey -out $sigfile $rsaoptions
echo Verifying with key $pubkey
openssl pkeyutl -verify -in $INFILE -pubin -inkey $pubkey -sigfile $sigfile $rsaoptions

