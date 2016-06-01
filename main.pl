#!/usr/bin/perl -w

# inicializar lista de contactos
@directorio = ();

require "ContactoEmpresarial.pm";
require "ContactoComun.pm";

sub mainPrincipal{

	agregarContactoEmpresarial("Carla Vargas",88885798,"www.tec.com","carlaVargas.ac.cr","San Carlos"); 
	agregarContactoEmpresarial("Karol Rosales",950620,"www.utn.com","KarolRosales.ac.cr","Zarcero"); 
	agregarContactoEmpresarial("Mario Gonzalez",7820093,"www.sancarlos.com","MarioG.ac.cr","Fortuna");

	agregarContactoComun("Yerlin Gomez",88517896,890204); 
	agregarContactoComun("Hector Cruz",88638947,885014750); 
	agregarContactoComun("Oscar Viquez",8836520,9605200);

}


sub imprimir{
	my $i;
	foreach $i (@directorio) {
		if($i->isa('ContactoComun')){
			print "Nombre: ",$i->{_nombre},"\n";
			print "Telefono: ",$i->{_telefono},"\n";
			print("\n\n");
		}else{
			print "Nombre: ",$i->{_nombre},"\n";
			print "Telefono: ",$i->{_telefono},"\n";
			if(defined $i->{_telefono2}){
				print "Telefono 2: ",$i->{_telefono2},"\n";
			}
			print "Direccion Web:",$i->{_direccionPagina},"\n";
			print "Correo electronico: ",$i->{_correoElectronico},"\n";
			print "Ubicacion: ",$i->{_ubicacion},"\n";
			print("\n\n");
		}
	}
}



#agregar contactos comunes a la lista de directorio
sub agregarContactoComun{
	my $nombre = shift;
	my $telefono = shift;
	my $telefono2 = shift;
	my $ObjContacto = new ContactoComun($nombre, $telefono,$telefono2);
	push(@directorio, $ObjContacto);
	#print "\n\n Contacto Agregado, direcctorio Actualizado: ", @directorio;
}
sub eliminarPersonaNombre{
	my $i;
	my $index = 0;
	my $nombre = shift;
	for my $i (@directorio){
		if($i->{_nombre} eq $nombre){
			print "Enconrte el nombre puto";
			splice @directorio, $index, 1;
		}
		my $value = $i->{_nombre};
		print "testing, $value \n";
		$index++;
	}
}

#List all of the contacts, sin importar que tipo sea
sub listMyContacts{
    my $id;
    my $index = 0;
    for my $i (@directorio){
        $index = ++$index;
		if($i->isa('ContactoComun')){
            print "#)$index \n";
			print "Nombre: ",$i->{_nombre},"\n";
			print "Telefono: ",$i->{_telefono},"\n";
			print("\n\n");
		}else{
            print "#) $index";
			print "Nombre: ",$i->{_nombre},"\n";
			print "Telefono: ",$i->{_telefono},"\n";
			if(defined $i->{_telefono2}){
				print "Telefono 2: ",$i->{_telefono2},"\n";
			}
			print "Direccion Web:",$i->{_direccionPagina},"\n";
			print "Correo electronico: ",$i->{_correoElectronico},"\n";
			print "Ubicacion: ",$i->{_ubicacion},"\n";
			print("\n\n");
		}
	}
    return $index;

}

#agregar a la lista
sub agregarContactoEmpresarial{
	my $nombre = shift;
	my $telefono = shift;
	my $direccionWeb = shift;
	my $correoElectronico = shift;
	my $ubicacion = shift;
	my $ObjContacto = new ContactoEmpresarial($nombre, $telefono,$direccionWeb, $correoElectronico,$ubicacion);
	push(@directorio, $ObjContacto);
	#print "\n\nContacto Agregado, direcctorio Actualizado: ", @directorio;
}

#agregar elemento al incio de la lista
sub agregarElementoInicio{
	my $nombre = shift;
	my $telefono = shift;
	my $direccionWeb = shift;
	my $correoElectronico = shift;
	my $ubicacion = shift;
	my $ObjContacto = new ContactoEmpresarial($nombre, $telefono,$direccionWeb, $correoElectronico,$ubicacion);
	unshift(@directorio,$ObjContacto);
	print "\n\nContacto Agregado al inicio, direcctorio Actualizado: ", @directorio;	
}


&mainPrincipal(); #llamar el metodo principal de la clase

listMyContacts();
