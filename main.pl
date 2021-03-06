#!/usr/bin/perl -w

# inicializar lista de contactos
@directorio = ();
use feature qw(switch);
require "ContactoEmpresarial.pm";
require "ContactoComun.pm";

sub mainPrincipal{

	print "\n\n\n****Bienvenido al sistema Agenda Contactos Perl****";
    $opcion = 0;
    do{
    print "\n Que desea realizar: ";
    print "\n\t1) Agregar Contacto.";
    print "\n\t2) Actualizar Contacto.";
    print "\n\t3) Eliminar Contacto.";
    print "\n\t4) Ver mis Contactos.";
    print "\n\t5) Salir.";
    print "\n\n-----------------------\nAccion: ";
	$opcion = <STDIN>;
    
        if ($opcion == 1) {
            print "\nOpciones de Contacto: \n";
            print "\t1)Contacto Comun.";
            print "\n\t1)Contacto Empresarial.";
            print "\nQue tipo de contacto desea agregar: ";
            $val = <STDIN>;
            given($val){
                when(1){
                    print "Ingrese el nombre del Contacto: ";
                    $nombre = <STDIN>;
                     print "Ingrese numero de telefono 1: ";
                    $telefono1 = <STDIN>;
                     print "Ingrese numero de telefono 2: ";
                    $telefono2 = <STDIN>;
                    agregarContactoComun($nombre,$telefono1,$telefono2);
                    print"\n\n\n\nAGREGADO CON EXITO!!!\n\n\n\n";
                    
                }
                when(2){
                    print "Ingrese el nombre del Contacto: ";
                    $nombre = <STDIN>;
                     print "Ingrese numero de telefono: ";
                    $telefono1 = <STDIN>;
                    print "Ingrese correo dominio: ";
                    $dominio = <STDIN>;
                     print "Ingrese correo electronico: ";
                    $email = <STDIN>;
                    print "Ingrese ubicacion de contacto: ";
                    $ubicacion = <STDIN>;
                    agregarContactoEmpresarial($nombre,$telefono1,$telefono2,$dominio,$email,$ubicacion);
                    print"\n\n\n\nAGREGADO CON EXITO!!!\n\n\n\n";
                }
                when(3){
                    $nombre = <STDIN>;
                    
                }
                default {
                print "Holy molly guacamole! error";
                }
            }
        }elsif ($opcion cmp 2){
            print "chango";
        }elsif ($opcion cmp 3){
            print "Ingrese el nombre del contacto que desea eliminar: ";
        }elsif ($opcion cmp 4){
            print "chango";
        }elsif ($opcion cmp 5){
            print "chango";
        }else{
            print "Error!. Opcion no valida";
        }   
    
    }while($opcion != 5);
    
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


#uso de actualizar info
sub actualizarInfo{
    print "chango";
}

sub agregarContactoComun{
	my $nombre = shift;
	my $telefono = shift;
	my $telefono2 = shift;
	my $ObjContacto = new ContactoComun($nombre, $telefono,$telefono2);
	push(@directorio, $ObjContacto);
	#print "\n\n Contacto Agregado, direcctorio Actualizado: ", @directorio;
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

&mainPrincipal(); #llamar el metodo principal de la clase

#listMyContacts();
actualizarInfo();