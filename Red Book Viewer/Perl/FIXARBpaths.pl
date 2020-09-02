#
# FIXARBpaths, JVN RTIS
#
# 2004-09-10 JVN Modified to use the RBVcatalog.txt file
#
# 2002-01-25 Modified to also correct Grant Red Book V2.5 and Application Red Book V1.6 paths
#
# Source:
# <!DOCTYPE PATDOC SYSTEM "ST32-US-Grant-025xml.dtd" [
#
# Target:
# <?xml-stylesheet href="..\..\stylesheet_factory\grant.xsl" type="text/xsl"?>
# <!DOCTYPE PATDOC SYSTEM "..\..\DTDS\st32-us-grant-025xml.dtd" [
#
$[ = 1;                             # set array base element to 1
$, = ' ';                           # set output field separator to space
$\ = "\n";                          # set output record separator
$! = 1;                             # flush output on write
$patent      = "";                  # accumulated file data
$infilename  = "";
$outfilename = "";
$line        = "";
$catalogFile = "\.\.\\DTDs\\RBVcatalog\.txt";
$catalogText = "";
$gotone      = 0;

if($ARGV[2]){
	$catalogFile  = $ARGV[2];
}

if(! -r $catalogFile){
	printf("ERROR: Unable to read the RBV catalog.\n");
	exit;
}
else{
	open(INFILE1,"<$catalogFile");
	$catalogText .= "\n";
	while (<INFILE1>) {$catalogText .= $_;}
	$catalogText .= "\n";
	close INFILE1;
}


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
	if($gotone){}
	else{
		if($line =~ /^\<\!DOCTYPE\s+.+\s+SYSTEM\s+\".+\"\s*\[/){
			$line   = &updateDOCTYPE($line);
			$gotone = 1;
		}
	}
	$patent .= $line;
}
close INFILE;

if($gotone){
	if($patent =~ /\n+$/){$patent = $`;}
	open(OUTFILE,">$outfilename");
	print OUTFILE $patent;
	close OUTFILE;
}
exit;

sub updateDOCTYPE{
	local($work,$lead,$rest,$dtd,$newDTD,$style);
	$work   = $_[1];
	$lead   = "unknown";
	$rest   = "unknown";
	$dtd    = "unknown";
	$newDTD = "unknown";
	$style  = "unknown";
	if($work =~ /^\<\!DOCTYPE\s+.+\s+SYSTEM\s+\"/){
		$lead = $&;
		$work = $';
	}
	if($work =~ /\"/){
		$dtd  = $`;
		$rest = "$&$'";
	}

	if($dtd =~ /unknown/){return $_[1];}
	if($catalogText =~ /\n$dtd\t/i){
		$work = $';
		if($work =~ /\n/){$work = $`;}
		if($work =~ /\t/){
			$newDTD = $`;
			$work   = $';
			if(length($work) > 0){$style = $work;}
		}
		else{$newDTD = "\.\.\\\.\.\\$dtd";}
		if($style =~ /unknown/){$work = "";}
		else{$work = "\<\?xml\-stylesheet\ href\=\"$style\"\ type\=\"text\/xsl\"\?\>\n";}
		$work .= "$lead$newDTD$rest";
		return $work;
	}
	return return $_[1];;
}