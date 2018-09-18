INFILE=../data/inputdata.txt
OUTDIR=../output
OUTBIN=$OUTDIR/inputdata.dgst.sha256.bin
OUTTXT=$OUTDIR/inputdata.dgst.sha256.txt

openssl dgst -sha256 -binary -out $OUTBIN $INFILE
openssl dgst -sha256 -out $OUTTXT $INFILE
