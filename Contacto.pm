#!/usr/bin/perl 

package Contacto;

sub new
{
	#contructor
    my $class = shift;
    my $self ={
	_nombre => shift,
	_telefono  => shift,
    };
	bless $self, $class;
	return $self;
}

#set  & get

sub getNombre{
	my $self = shift;
	return $self->{_nombre};
}

sub getTelefono{
	my $self = shift;
	return $self->{_telefono};
}


sub setTelefono{
	my ( $self, $telefono) = @_;
	$self->{_telefono} = $telefono if defined($telefono);
	return $self->{_telefono};
}

sub setNombre {
	my ( $self, $nombre ) = @_;
	$self->{_nombre} = $nombre if defined($nombre);
	return $self->{_nombre};
}
1;


