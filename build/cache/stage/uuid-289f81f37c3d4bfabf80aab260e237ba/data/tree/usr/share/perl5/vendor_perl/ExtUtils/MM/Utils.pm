package ExtUtils::MM::Utils;

require 5.006;

use strict;
use vars qw($VERSION);
$VERSION = '7.11_06';
$VERSION = eval $VERSION;  ## no critic [BuiltinFunctions::ProhibitStringyEval]

=head1 NAME

ExtUtils::MM::Utils - ExtUtils::MM methods without dependency on ExtUtils::MakeMaker

=head1 SYNOPSIS

    require ExtUtils::MM::Utils;
    MM->maybe_command($file);

=head1 DESCRIPTION

This is a collection of L<ExtUtils::MM> subroutines that are used by many
other modules but that do not need full-featured L<ExtUtils::MakeMaker>. The
issue with L<ExtUtils::MakeMaker> is it pulls in Perl header files and that is
an overkill for small subroutines.

An example is the L<IPC::Cmd> that caused installing GCC just because of
three-line I<maybe_command()> from L<ExtUtils::MM_Unix>.

The intentions is to use L<ExtUtils::MM::Utils> instead of
L<ExtUtils::MakeMaker> for these trivial methods. You can still call them via
L<MM> class name.

=head1 METHODS

=over 4

=item maybe_command

Returns true, if the argument is likely to be a command.

=cut

if (!exists $INC{'ExtUtils/MM.pm'}) {
    *MM::maybe_command = *ExtUtils::MM::maybe_command = \&maybe_command;
}

sub maybe_command {
    my($self,$file) = @_;
    return $file if -x $file && ! -d $file;
    return;
}

1;

=back

=head1 BUGS

These methods are copied from L<ExtUtils::MM_Unix>. Other operating systems
are not supported yet. The reason is this
L<a hack for Linux
distributions|https://bugzilla.redhat.com/show_bug.cgi?id=1129443>.

=head1 SEE ALSO

L<ExtUtils::MakeMaker>, L<ExtUtils::MM>

=cut
