#!/bin/sh 

. lib/libreria.sh

##METHODS

dni=""
nombre=""
domicilio=""
telefono_fijo=""
telefono=""
email=""

reset_values(){
	dni=""
	nombre=""
	domicilio=""
	telefono_fijo=""
	telefono=""
	email=""	
}

menu(){
	echo
	echo
	subtitle "Menu"
	echo 
	echo "1.Introducir registro"
	echo "2.Abrir csv"
	echo "3.Salir"
	echo 

}

save_value(){
	case $1 in
		dni) dni=$2 ;;
		nombre) nombre=$2 ;;
		domicilio) domicilio=$2;;
		telefono_fijo) telefono_fijo=$2;;
		telefono) telefono=$2;;
		email) email=$2;;	
	esac
}

value(){
	subtitle "$1"
	end=1
	while is_equal $end 1 
	do 
		echo "Introduce el $1 : \c" 
		read var 
		if $2 $var
		then 
			save_value $1 $var
			end=0
		else
			correct_value $1
		fi
	done

}

simple_value(){
	subtitle "$1"
	echo "Introduce el $1 : \c" 
	read var
	save_value $1 $var
}

add_register(){

	title "Registro"
	##value dni is_dni
	simple_value nombre
	simple_value domicilio
	##value telefono is_phone_number
	##value telefono_fijo is_phone_fixed_number
	##value email is_email

	msg_start_table
	msg_value_table "Dni" $dni
	msg_value_table "Nombre" $nombre
	msg_value_table "Domicilio" $domicilio
	msg_value_table "Telefono" $telefono
	msg_value_table "Telefono_fijo" $telefono_fijo
	msg_value_table "Email" $email

	msg "¿Desea guardar los datos? (s/n): \c"
	read var

	if [ $var = "s" ]
		then
			echo "guardado"
		else
			echo "no guardado"
		fi

	stop
}

##MAIN

title "BD-CSV"

end=1
option=0

string_to_save=""

while is_equal $end 1
do 
	menu
	read option

	case $option in
	1)
		add_register
		;;
	2)
		echo "See you again!"
		break
		;;
	3)
		echo
		end_title
		exit 0

		
  esac

done 