INFILE=../data/inputdata.txt
OUTBIN=inputdata.dgst.sha256.bin
OUTTXT=inputdata.dgst.sha256.txt

openssl dgst -sha256 -binary -out $OUTBIN $INFILE
openssl dgst -sha256 -out $OUTTXT $INFILE
