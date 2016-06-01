require 'Contacto.pm';

package ContactoComun;
use Contacto;
use strict;
our @ISA = qw(Contacto); # herencia de clase Contacto



# Override constructor
sub new {
       my ($class) = @_;

       # Call the constructor of the parent class, Person.
       my $self = $class->SUPER::new( $_[1], $_[2]);
       # Add few more attributes
       $self->{_telefono2} = $_[3];
       bless $self, $class;
       return $self;
    };


#get & set
sub getTelefono2{
     my( $self ) = @_;
     return $self->{_telefono2};
    }


# Override
sub getNombre {
        my( $self ) = @_;
        return $self->{_nombre};
    }

sub getTelefono{
        my( $self ) = @_;
        return $self->{_telefono};
}

1;

#prueba
#my $obj = new ContactoComun("Crisly", "8882585178","24600782");
#print("Clase Contacto ContactoComun \n");
#print $obj->getNombre(),"\n";
#print $obj->getTelefono(),"\n";
#print $obj->getTelefono2(),"\n";
