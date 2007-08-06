package CPU::Emulator::6502::Op::TAX;

use strict;
use warnings;

use constant ADDRESSING => {
    implied => 0xAA,
};

=head1 NAME

CPU::Emulator::6502::Op::TAX - Transfer the accumulator to the X register

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 implied( )

=cut

sub implied {
    my $self = shift;
    my $reg = $self->registers;

    $reg->{ x } = $reg->{ acc };
    $reg->{ status } &= CPU::Emulator::6502::CLEAR_SIGN;
    $reg->{ status } &= CPU::Emulator::6502::CLEAR_ZERO;

    $reg->{ status } |= CPU::Emulator::6502::SET_SIGN if $reg->{ x } & 0x80;
    $reg->{ status } |= CPU::Emulator::6502::SET_ZERO if $reg->{ x } == 0;

    $reg->{ pc }++;
}

=head1 AUTHOR

Brian Cassidy E<lt>bricas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Brian Cassidy

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=head1 SEE ALSO

=over 4 

=item * L<CPU::Emulator::6502>

=back

=cut

1;
