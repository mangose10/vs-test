#
# 2004-09-15 HL
#
# remove line started with for ice.
# <!DOCTYPE 
#
$[ = 1;                             # set array base element to 1
$, = ' ';                           # set output field separator to space
$\ = "\n";                          # set output record separator
$! = 1;                             # flush output on write
$patent      = "";                  # accumulated file data
$infilename  = "";
$outfilename = "";
$line        = "";
 



if($ARGV[1]){
	$infilename  = $ARGV[1];
	$outfilename = $infilename;
	printf("    Processing $infilename\n");
}
else{
	printf("ERROR: No Input File Specified.\n");
	exit;
}

if(! -r $infilename){
	printf("ERROR: Invalid input file. Verify $infilename exists with read privileges.\n");
	exit;
}
else{open(INFILE,"<$infilename");}

while (<INFILE>) {
	$line = $_;
	 
	if ($line =~ /^\<\!DOCTYPE\s+us-patent-grant+\s/){}
	
#	if ($line =~ /^\<\!DOCTYPE\s/){}	
		else
		{	if ($line =~ /^\<\!DOCTYPE\s+us-patent-application+\s/){}
		   	else
		   	{if ($line =~ /^\<\!DOCTYPE\s+application-body+\s/){}
		   	 else
		   	 {
		   	 $patent .= $line;
		   	 }
		   	}
		
		
		}	
}
close INFILE;

	if($patent =~ /\n+$/){$patent = $`;}
	open(OUTFILE,">$outfilename");
	print OUTFILE $patent;
	close OUTFILE;

exit;

