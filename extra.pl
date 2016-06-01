#!/usr/bin/perl -w

# inicializar lista de contactos
@directorio = ("persona1","persona2");

require "ContactoEmpresarial.pm";


sub mainPrincipal{
	print "****Bienvenido al sistema****";
	print("\n\nLista de contactos: ");
	print(@directorio);
	
	print("\n\n[Agregando contacto]");
	agregarContactoP("Carla Vargas",88885798,"www.tec.com","carlaVargas.ac.cr","San Carlos"); 

	print("\n\n[Eliminar elemento en 1 la lista]\n");
	eliminarPrimeroList();

	print("\n\n[Eliminar ultimo elemento en la lista]\n");
	eliminarUltimoList();
}


sub agregarContactoP{
	my $nombre = shift;
	my $telefono = shift;
	my $direccionWeb = shift;
	my $correoElectronico = shift;
	my $ubicacion = shift;
	my $ObjContacto = new ContactoEmpresarial($nombre, $telefono,$direccionWeb, $correoElectronico,$ubicacion);
	push(@directorio, $ObjContacto);
	print "\n\nContacto Agregado, direcctorio Actualizado: ", @directorio;
	}

# agregar elemento al array
sub agregarContactos{
	my $obj1 = new ContactoEmpresarial("Oscar Viquez", 885201,"www.tec.cr", "oviquez.ac.cr","San Carlos");
	push(@directorio, $obj1);
	print  "Directorio de contactos actualizado ", @directorio,"\n";
}


#agregar elemento al incio de la lista
sub agregarElementoInicio{
	unshift(@directorio, "Dollar");
	print "3. \@directorio  = @directorio\n";
}


# Eliminar ultimo elemento de la lista
sub eliminarUltimoList{
		pop(@directorio);
		print @directorio;
	}
	

# Eliminar Elemento car en el array
sub eliminarPrimeroList{
	shift(@directorio);
	print @directorio;
}




&mainPrincipal();
