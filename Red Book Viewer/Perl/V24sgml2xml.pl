#
# V24sgml2xml, JVN USPTO
#
$[ = 1;                             # set array base element to 1
$, = ' ';                           # set output field separator to space
$\ = "\n";                          # set output record separator
$! = 1;                             # flush output on write
$patent      = "";                  # accumulated file data
$infilename  = "";
$outfilename = "";
$line       = "";
$line1      = "\<\?xml\ version\=\"1\.0\"\ encoding\=\"UTF\-8\"\?\>\n";
#$line2      = "\<\?xml\-stylesheet\ href\=\"\.\.\\stylesheet\_factory\\grant\-tiff\.xsl\"\ type\=\"text\/xsl\"\?\>\n";
$line2      = "\<\?xml\-stylesheet\ href\=\"..\\..\\stylesheet\_factory\\grant\.xsl\"\ type\=\"text\/xsl\"\?\>\n";
$line3      = "\<\!DOCTYPE\ PATDOC\ SYSTEM\ \"..\\..\\DTDS\\st32\-us\-grant\-024xml\.dtd\"\ \[";
$rest       = "";

if($ARGV[1]){
	$infilename = $ARGV[1];
	$outfilename = $infilename;
	if($outfilename =~ /\.sgm$/) {$outfilename = "$`\.xml";}
	if($outfilename =~ /\.sgml$/){$outfilename = "$`\.xml";}
	if($outfilename =~ /\.SGM$/) {$outfilename = "$`\.xml";}
	if($outfilename =~ /\.SGML$/){$outfilename = "$`\.xml";}
	printf("    Processing $infilename\n");
}
else{
	printf("ERROR: No SGML File Specified.\n");
	exit;
}

if(! -r $infilename){
	printf("ERROR: Invalid SGML file. Verify $infilename exists with read privileges.\n");
	close INFILE;
	exit;
}
else{open(INFILE,"<$infilename");}

while (<INFILE>) {
	$line = $_;
	if($line =~ /^\<\!DOCTYPE\ PATDOC\ PUBLIC\ \"\-\/\/USPTO\/\/DTD\ ST\.32\ US\ PATENT\ GRANT\ V2\.4\ 2000\-09\-20\/\/EN\"\ \[/){
		$rest = $';
		$line = "$line1$line2$line3$rest";
	}
	$patent .= $line;
}
close INFILE;
&fixEMPTY("B221US",$patent);
&fixEMPTY("B473US",$patent);
&fixEMPTY("B597US",$patent);
&fixEMPTY("CHEMCDX",$patent);
&fixEMPTY("CHEMMOL",$patent);
&fixEMPTY("CITED\-BY\-EXAMINER",$patent);
&fixEMPTY("CITED\-BY\-OTHER",$patent);
&fixEMPTY("CLREF",$patent);
&fixEMPTY("CRF",$patent);
&fixEMPTY("CUSTOM\-CHARACTER",$patent);
&fixEMPTY("DEL\-E",$patent);
&fixEMPTY("DEL\-S",$patent);
&fixEMPTY("DFREF",$patent);
&fixEMPTY("EMI",$patent);
&fixEMPTY("EMR",$patent);
&fixEMPTY("FOR",$patent);
&fixEMPTY("INS\-E",$patent);
&fixEMPTY("INS\-S",$patent);
&fixEMPTY("LSTREF",$patent);
&fixEMPTY("MATHEMATICA",$patent);
&fixEMPTY("PAREF",$patent);
&fixEMPTY("TBLREF",$patent);
&fixEMPTY("SEQREF",$patent);
&fixEMPTY("colspec",$patent);
&fixEMPTY("spanspec",$patent);
&fixEMPTY("mspace",$patent);
&fixEMPTY("mprescripts",$patent);
&fixEMPTY("none",$patent);
&fixEMPTY("malignmark",$patent);
&fixEMPTY("maligngroup",$patent);
&fixEMPTY("sep",$patent);
&fixEMPTY("inverse",$patent);
&fixEMPTY("ident",$patent);
&fixEMPTY("compose",$patent);
&fixEMPTY("exp",$patent);
&fixEMPTY("abs",$patent);
&fixEMPTY("conjugate",$patent);
&fixEMPTY("factorial",$patent);
&fixEMPTY("minus",$patent);
&fixEMPTY("quotient",$patent);
&fixEMPTY("divide",$patent);
&fixEMPTY("power",$patent);
&fixEMPTY("rem",$patent);
&fixEMPTY("plus",$patent);
&fixEMPTY("max",$patent);
&fixEMPTY("min",$patent);
&fixEMPTY("times",$patent);
&fixEMPTY("gcd",$patent);
&fixEMPTY("root",$patent);
&fixEMPTY("exists",$patent);
&fixEMPTY("forall",$patent);
&fixEMPTY("and",$patent);
&fixEMPTY("or",$patent);
&fixEMPTY("xor",$patent);
&fixEMPTY("not",$patent);
&fixEMPTY("implies",$patent);
&fixEMPTY("log",$patent);
&fixEMPTY("int",$patent);
&fixEMPTY("diff",$patent);
&fixEMPTY("partialdiff",$patent);
&fixEMPTY("ln",$patent);
&fixEMPTY("setdiff",$patent);
&fixEMPTY("union",$patent);
&fixEMPTY("intersect",$patent);
&fixEMPTY("sum",$patent);
&fixEMPTY("product",$patent);
&fixEMPTY("limit",$patent);
&fixEMPTY("sin",$patent);
&fixEMPTY("cos",$patent);
&fixEMPTY("tan",$patent);
&fixEMPTY("sec",$patent);
&fixEMPTY("csc",$patent);
&fixEMPTY("cot",$patent);
&fixEMPTY("sinh",$patent);
&fixEMPTY("cosh",$patent);
&fixEMPTY("tanh",$patent);
&fixEMPTY("sech",$patent);
&fixEMPTY("csch",$patent);
&fixEMPTY("coth",$patent);
&fixEMPTY("arcsin",$patent);
&fixEMPTY("arccos",$patent);
&fixEMPTY("arctan",$patent);
&fixEMPTY("mean",$patent);
&fixEMPTY("sdev",$patent);
&fixEMPTY("var",$patent);
&fixEMPTY("median",$patent);
&fixEMPTY("mode",$patent);
&fixEMPTY("moment",$patent);
&fixEMPTY("determinant",$patent);
&fixEMPTY("transpose",$patent);
&fixEMPTY("select",$patent);
&fixEMPTY("neq",$patent);
&fixEMPTY("eq",$patent);
&fixEMPTY("gt",$patent);
&fixEMPTY("lt",$patent);
&fixEMPTY("geq",$patent);
&fixEMPTY("leq",$patent);
&fixEMPTY("in",$patent);
&fixEMPTY("notin",$patent);
&fixEMPTY("notsubset",$patent);
&fixEMPTY("notprsubset",$patent);
&fixEMPTY("subset",$patent);
&fixEMPTY("prsubset",$patent);
&fixEMPTY("tendsto",$patent);

&fixCALSTablesLC();

if($patent =~ /\n+$/){$patent = $`;}

open(OUTFILE,">$outfilename");
print OUTFILE $patent;
close OUTFILE;
exit;

sub fixEMPTY{
    local($tag,$text,$work);
    $tag = $_[1];
    $text= $_[2];
    $work= "";
    if($text =~ /\<$tag[\ |\>]/i){
        while($text =~ /\<$tag/i){
            $work .= "$`$&";
            $text  = $';
            if($text =~ /^\>/){ # no attributes
                $work .= "\/\>";
                $text  = $';
            }
            else{
                if($text =~ /^\ /){ # got one with an attribute
                    if($text =~ /\>/){
                        $work .= "$`\/\>";
                        $text  = $';
                    }
                    else{printf("ERROR -- unable to locate trailing \> in element $tag\n");}
                }
                else{} # non space or > after element name - probable another element with same leading characters
            }
        }
        $work .= $text;
        $_[2]  = $work;
    }
    return;
}

sub fixCALSTablesLC{
    local($patent2);
    #
    #	Element and attribute case conversions and values
    #
    #	ELEMENT table
    #	ATTLIST table
    #		frame           (top|bottom|topbot|all|sides|none)
    #		colsep
    #		rowsep
    #		pgwide
    #		bodyatt
    #
    #	ELEMENT tgroup
    #	ATTLIST tgroup
    #		cols
    #		colsep
    #		rowsep
    #		align           (left|right|center|justify|char)
    #
    #	ELEMENT colspec		This is the only empty element.
    #	ATTLIST colspec
    #		colnum
    #		colname
    #		colwidth
    #		colsep
    #		rowsep
    #		align           (left|right|center|justify|char)
    #		char
    #		charoff
    #
    #	ELEMENT thead
    #	ATTLIST thead
    #		valign          (top|middle|bottom)
    #
    #	ELEMENT tbody
    #	ATTLIST tbody
    #		valign          (top|middle|bottom)
    #
    #	ELEMENT row
    #	ATTLIST row
    #		rowsep
    #		valign          (top|middle|bottom)
    #
    #	ELEMENT entry
    #	ATTLIST entry
    #		colname
    #		namest
    #		nameend
    #		morerows
    #		colsep
    #		rowsep
    #		align           (left|right|center|justify|char)
    #		char
    #		charoff
    #		valign          (top|middle|bottom)
    #
    #
    # Grant Red Book DTD Override:
    #
    # <!ENTITY % tbl.table.att        " pgwide      %yesorno;       #IMPLIED
    #                                   orient      (port | land)   #IMPLIED
    #                                   tabstyle    NMTOKEN         #IMPLIED">
    #

    $patent2 = "";
    $patent2 = &fixCALSelement("table",$patent);
    if($patent2){$patent = $patent2;}
    return;
}

sub fixCALSelement{
    local($tag,$text,$work,$leadTag,$content,$trailTag,$content2);
    $tag     = $_[1];
    $text    = $_[2];
    $work    = "";
    $leadTag = "";
    $content = "";
    $trailTag= "";
    if($text =~ /\<$tag(\ |\>)/i){
        while($text =~ /\<$tag(\ |\>)/i){
            $work   .= $`;
            $leadTag = $&;
            $text    = $';
            if($leadTag =~ /\>$/){} # Ok, got the full lead tag
            else{
                if($text =~ /\>/i){
                    $leadTag .= "$`$&";
                    $text    = $';
                }
                else{printf("ERROR -- unable to locate closing \> for the leading tag of element $tag\n");}
            }
            if($tag =~ /^colspec$/i){
                $content = "";
                $trailTag= "";
            }
            else{
                if($text =~ /\<\/$tag\>/i){
                    $content = $`;
                    $trailTag= $&;
                    $text    = $';
                }
                else{printf("ERROR -- unable to locate closing tag for element $tag\n");}
            }
            $content2 = "";
            if($tag =~ /^table$/i)  {
                #	ELEMENT table
                #	ATTLIST table
                #		frame           (top|bottom|topbot|all|sides|none)
	        #		colsep
	        #		rowsep
	        #		pgwide
	        #		bodyatt
		# <!ENTITY % tbl.table.att        " pgwide      %yesorno;       #IMPLIED
		#                                   orient      (port | land)   #IMPLIED
		#                                   tabstyle    NMTOKEN         #IMPLIED">
	        
	        &fixString($leadTag,"<table");
	        &fixString($leadTag,"frame");
	        &fixString($leadTag,"colsep");
	        &fixString($leadTag,"rowsep");
	        &fixString($leadTag,"pgwide");
	        &fixString($leadTag,"orient");
	        &fixString($leadTag,"tabstyle");
	        &fixString($leadTag,"bodyatt");
	        &fixString($leadTag,"\"top\"");
	        &fixString($leadTag,"\"bottom\"");
	        &fixString($leadTag,"\"topbot\"");
	        &fixString($leadTag,"\"all\"");
	        &fixString($leadTag,"\"sides\"");
	        &fixString($leadTag,"\"none\"");
	        &fixString($leadTag,"\"port\"");
	        &fixString($leadTag,"\"land\"");
	        
                $content2 = &fixCALSelement("tgroup",$content);
                $content = $content2;
                &lowerCase($trailTag);
            }
            if($tag =~ /^tgroup$/i) {
                #	ELEMENT tgroup
	        #	ATTLIST tgroup
	        #		cols
	        #		colsep
	        #		rowsep
	        #		align           (left|right|center|justify|char)

	        &fixString($leadTag,"<tgroup");
	        &fixString($leadTag,"cols");
	        &fixString($leadTag,"colsep");
	        &fixString($leadTag,"rowsep");
	        &fixString($leadTag,"align");
	        &fixString($leadTag,"\"left\"");
	        &fixString($leadTag,"\"right\"");
	        &fixString($leadTag,"\"center\"");
	        &fixString($leadTag,"\"justify\"");
	        &fixString($leadTag,"\"char\"");
	        
                $content2 = &fixCALSelement("colspec",$content);
                $content = $content2;
                $content2 = &fixCALSelement("thead",$content);
                $content = $content2;
                $content2 = &fixCALSelement("tbody",$content);
                $content = $content2;
                &lowerCase($trailTag);
            }
            if($tag =~ /^colspec$/i){
	        #	ELEMENT colspec		This is the only empty element.
	        #	ATTLIST colspec
	        #		colnum
	        #		colname
	        #		colwidth
	        #		colsep
	        #		rowsep
	        #		align           (left|right|center|justify|char)
	        #		char
	        #		charoff
	        #
	        &fixString($leadTag,"<colspec");
	        &fixString($leadTag,"colnum");
	        &fixString($leadTag,"colname");
	        &fixString($leadTag,"colwidth");
	        &fixString($leadTag,"colsep");
	        &fixString($leadTag,"rowsep");
	        &fixString($leadTag,"align");
	        &fixString($leadTag,"char");
	        &fixString($leadTag,"charoff");
	        &fixString($leadTag,"\"left\"");
	        &fixString($leadTag,"\"right\"");
	        &fixString($leadTag,"\"center\"");
	        &fixString($leadTag,"\"justify\"");
	        &fixString($leadTag,"\"char\"");

                &lowerCase($trailTag);
            }
            if($tag =~ /^thead$/i)  {
	        #	ELEMENT thead
	        #	ATTLIST thead
	        #		valign          (top|middle|bottom)
	        #
	        &fixString($leadTag,"<thead");
	        &fixString($leadTag,"valign");
	        &fixString($leadTag,"\"top\"");
	        &fixString($leadTag,"\"middle\"");
	        &fixString($leadTag,"\"bottom\"");
                $content2 = &fixCALSelement("row",$content);
                $content = $content2;
                &lowerCase($trailTag);
            }
            if($tag =~ /^tbody$/i)  {
	        #	ELEMENT tbody
	        #	ATTLIST tbody
	        #		valign          (top|middle|bottom)
	        #
	        &fixString($leadTag,"<tbody");
	        &fixString($leadTag,"valign");
	        &fixString($leadTag,"\"top\"");
	        &fixString($leadTag,"\"middle\"");
	        &fixString($leadTag,"\"bottom\"");
                $content2 = &fixCALSelement("row",$content);
                $content = $content2;
                &lowerCase($trailTag);
            }
            if($tag =~ /^row$/i)    {
	        #	ELEMENT row
	        #	ATTLIST row
	        #		rowsep
	        #		valign          (top|middle|bottom)
	        #
	        &fixString($leadTag,"<row");
	        &fixString($leadTag,"rowsep");
	        &fixString($leadTag,"valign");
	        &fixString($leadTag,"\"top\"");
	        &fixString($leadTag,"\"middle\"");
	        &fixString($leadTag,"\"bottom\"");
                $content2 = &fixCALSelement("entry",$content);
                $content = $content2;
                &lowerCase($trailTag);
            }
            if($tag =~ /^entry$/i)  {
	        #	ELEMENT entry
	        #	ATTLIST entry
	        #		colname
	        #		namest
	        #		nameend
	        #		morerows
	        #		colsep
	        #		rowsep
	        #		align           (left|right|center|justify|char)
	        #		char
	        #		charoff
	        #		valign          (top|middle|bottom)
	        #
	        &fixString($leadTag,"<entry");
	        &fixString($leadTag,"colname");
	        &fixString($leadTag,"namest");
	        &fixString($leadTag,"nameend");
	        &fixString($leadTag,"morerows");
	        &fixString($leadTag,"colsep");
	        &fixString($leadTag,"rowsep");
	        &fixString($leadTag,"align");
	        &fixString($leadTag,"char");
	        &fixString($leadTag,"charoff");
	        &fixString($leadTag,"valign");
	        &fixString($leadTag,"\"left\"");
	        &fixString($leadTag,"\"right\"");
	        &fixString($leadTag,"\"center\"");
	        &fixString($leadTag,"\"justify\"");
	        &fixString($leadTag,"\"char\"");
	        &fixString($leadTag,"\"top\"");
	        &fixString($leadTag,"\"middle\"");
	        &fixString($leadTag,"\"bottom\"");
                &lowerCase($trailTag);
            }
            $work .= "$leadTag";
            $work .= "$content";
            $work .= "$trailTag";
        }
        $work .= $text;
    }
    if($work){return $work;}
    else{return $text;}
}

sub lowerCase{
    local($text);
    $text = $_[1];
    $_[1] =~ tr/A-Z/a-z/;
    return;
}

sub fixString{
    local($text,$search,$work,$match);
    $text   = $_[1];
    $search = $_[2];
    $work   = "";
    $match  = "";
    while($text =~ /$search/i){
        $work .= $`;
        $match = $&;
        $text  = $';
        $match =~ tr/A-Z/a-z/;
        $work .= $match;
    }
    if($text){$work .= $text;}
    $_[1] = $work;
    return;
}
