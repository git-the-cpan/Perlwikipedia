# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Perlwikipedia.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 1;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
use Perlwikipedia;

$wikipedia=Perlwikipedia->new("make test");
$article="WMIZ";

if(defined($ENV{'PWPMakeTestSetWikiHost'})) {
	$wikipedia->set_wiki($ENV{'PWPMakeTestSetWikiHost'}, $ENV{'PWPMakeTestSetWikiDir'});
	$article="Main Page" unless ($ENV{'PWPMakeTestSetWikiHost'}.$ENV{'PWPMakeTestSetWikiDir'} eq 'en.wikipedia.orgw');
}

my @links = $wikipedia->what_links_here($article);

ok( defined $links[0]->{title} );
