echo  "dir mdl fgspecies bgspecies om0 lnlm0 npm0 ombnfg ombnbg lnlbn npbn ombffg ombfbg lnlbf npbf" |sed 's/ /\t/g' > compiled_result.txt

for i in `grep ">" APOC1_ORFout_gbgc.fasta_PRANK.aln |sed 's/>//g'` 
do 
for m in bneutral  
do
for cf in F3x4 F1x4 
do 
x=`echo "$i"_"$cf"_"$m"`
ombnfg=`grep "(dN/dS)" $bneutral|awk '{print $6}'`
ombnbg=`grep "(dN/dS)" $bneutral|awk '{print $5}'`
lnlbn=`grep "lnL" $bneutral|awk '{print $4}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
npbn=`grep "lnL" $bneutral|awk '{print $3}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
bgspecies=`grep -A1 "w ratios as labels for TreeView" $bneutral|tail -n1|sed -e 's/(/\n/g' -e 's/)/\n/g' -e 's/,/\n/g'|grep "[A-Z]"|awk '{print $1"\t"$2}'|sed 's/#/\t/g'|awk '$2!=1{print $1}'|tr '\n' ','|sed 's/,$/\n/g'`
fgspecies=`grep -A1 "w ratios as labels for TreeView" $bneutral|tail -n1|sed -e 's/(/\n/g' -e 's/)/\n/g' -e 's/,/\n/g'|grep "[A-Z]"|awk '{print $1"\t"$2}'|sed 's/#/\t/g'|awk '$2==1{print $1}'`
done
done
for m in bfree
do
for cf in F3x4 F1x4
do
y=`echo "$i"_"$cf"_"$m"`
ombffg=`grep "(dN/dS)" $y.out|awk '{print $6}'`
ombfbg=`grep "(dN/dS)" $bfree|awk '{print $5}'`
lnlbf=`grep "lnL" $bfree|awk '{print $4}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
npbf=`grep "lnL" $bfree|awk '{print $3}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
done
done
