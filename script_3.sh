#!/bin/sh 

. lib/libreria.sh

#general values

file_csv="data.csv"
file_to_read="./$file_csv"
dni=""
nombre=""
domicilio=""
telefono_fijo=""
telefono=""
email=""


##METHODS
#####methods to add

reset_values(){
	dni=""
	nombre=""
	domicilio=""
	telefono_fijo=""
	telefono=""
	email=""	
}

  correct_value(){

    case $1 in
      dni)      message="Introduce el dni correctamente";;
      email)    message="Introduce el email correctamente\nEl sistema no permite caracteres especiales {._-/*}";;
      telefono) message="Introduce el teléfono correctamente" ;;
      fijo)     message="Introduce el telefono fijo correctamente";;
      *)        message="Introduce un valor correcto";;
    esac

    echo
    echo $message
    echo
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

save_to_csv(){
	string_to_save="$dni;$nombre;$domicilio;$telefono_fijo;$telefono;$email"
	echo "$string_to_save" >> data.csv
}

save_value(){
	case $1 in
		dni) dni=$2 ;;
		nombre)
			if is_mayor $# 1
			then
				shift
				nombre=$*
			else
				nombre=$2
			fi
			;;
		domicilio) 
			if is_mayor $# 1
			then
				shift
				domicilio=$*
			else
				domicilio=$2
			fi
			;;
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
	reset_values

	title "Registro"
	value dni is_dni
	simple_value nombre
	simple_value domicilio
	#value telefono is_phone_number
	#value telefono_fijo is_phone_fixed_number
	#value email is_email

	msg_start_table
	msg_value_table "Dni : " $dni
	msg_value_table "Nombre : " $nombre
	msg_value_table "Domicilio : " $domicilio
	msg_value_table "Telefono : " $telefono
	msg_value_table "Telefono_fijo : " $telefono_fijo
	msg_value_table "Email : " $email
	msg_finish_table

	msg "¿Desea guardar los datos? (s/n): \c"
	read var

	if [ $var = "s" ]
		then
			save_to_csv
			echo "guardado"
		else
			echo "no guardado"
		fi
}

#####methods to csv
csv(){
	echo 
	subtitle CSV FILE
	cat $file_to_read
	echo
}

delete_csv_file(){
	echo
	msg "¿Estas seguro? (s/n) : \c"
	read var

	if [ $var = "s" ]
		then
		rm $file_to_read
		msg "$file_csv Borrado"
	fi



}

delete_row_csv_file(){
	
	#string=$(cat $file_to_read | grep -n $dni)

	echo 
	msg "Escribe el dni para eliminarlo : \c"
	read dni

	##TODO : ACABAR COMPROBACIÓN DE DNI

	line=$(cat $file_to_read | grep -n $dni | cut -d":" -f1)
	sed -i $line'd' $file_to_read
	echo "Registro borrado"

}

menu_csv(){

	end=1
	while is_equal $end 1
	do
		subtitle Menu csv
		echo "1.Borrar registro"
		echo "2.Borrar archivo"
		echo "3.Salir"
		echo 
		msg "Opción : \c"
		read var

		case $var in
			1)
				delete_row_csv_file
				;;
			2) 
				delete_csv_file
				break;;	
			3) 
				break;;
		esac	
	done
}



##MAIN

title "BD-CSV"

end_menu=1
option=0

string_to_save=""

while is_equal $end_menu 1
do 
	menu
	echo
	echo "Opción : \c"
	read option

	case $option in
	1)
		add_register
		;;
	2)
		if exist_file $file_to_read
			then
				csv
				menu_csv
			else
				echo
				msg "No existe, introduce datos"
		fi
		;;
	3)
		echo
		end_title
		exit 0

		
  esac

done 