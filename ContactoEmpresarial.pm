require 'Contacto.pm';

package ContactoEmpresarial;
use Contacto;
use strict;
our @ISA = qw(Contacto); # herencia de clase Contacto
#use Contacto;


# Override constructor
sub new {
       my ($class) = @_;

       # Call the constructor of the parent class, Person.
       my $self = $class->SUPER::new( $_[1], $_[2]);
       # Add few more attributes
       $self->{_direccionPagina} = $_[3];
       $self->{_correoElectronico} = $_[4];
       $self->{_ubicacion} = $_[5] ;
       bless $self, $class;
       return $self;
    };



# Override helper function
    sub getNombre {
        my( $self ) = @_;
        return $self->{_nombre};
    }

    sub getTelefono{
        my( $self ) = @_;
        return $self->{_telefono};
    }

    sub getDireccionPagina{
        my( $self ) = @_;
        return $self->{_direccionPagina};
    }

    sub getCorreoElectronico{
          my( $self ) = @_;
        return $self->{_correoElectronico};
    }

    sub getUbicacion{
        my( $self ) = @_;
        return $self->{_ubicacion};
    }
    
1;

#my $obj = new ContactoEmpresarial("Crisly", "8882585178","www.crisly.com","gonzalezXD","San Carlos");
#print("\n\n\nClase Contacto Empresarial \n");
#print $obj->getNombre(),"\n";
#print $obj->getTelefono(),"\n";
#print $obj->getUbicacion(),"\n";
#print $obj->getCorreoElectronico(),"\n";
#print $obj->getDireccionPagina(),"\n";
