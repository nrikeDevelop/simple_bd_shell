#
# Libreria de funciones
#



is_equal()
{
  if [ $1 -eq $2 ]
    then
      return 0
    else
      return 1
    fi
}



  title()
   {
        echo "*************************** gitHub: nrikeDevelop *******"
        echo $1
        echo "********************************************************"
   }

  subtitle(){
    echo 
    echo $*
    echo "***************************************"
  } 

  end_title(){
    echo "************ gitHub: nrikeDevelop******"
  }

  msg(){
    echo $1
  }

  msg_start_table(){
    echo 
    echo "************************"
    echo "\tData"
    echo "************************"
  }

  msg_value_table(){
    echo 
    echo "\t$*"
    echo 
  }

  msg_finish_table(){
    echo
    echo "************************"
    echo 
  }



  stop()
  {
    echo "Pulse intro para continuar ... \c"
    read s
  }

  is_mayor()
     {
          if [ $1 -gt $2 ]
	     then
		return 0
	   else
		return 1
	fi
   }

is_mayor_equal()
   {
    if [ $1 -ge $2 ]
      then
        return 0
      else
        return 1
      fi
   }

is_minor()
   {
        if [ $1 -lt $2 ]
	   then
		return 0
	   else
		return 1
	fi
   }

is_minor_iqual()
   {
        if [ $1 -le $2 ]
	   then
		return 0
	   else
		return 1
	fi
   }

f_group()
   {
	f_nomgru=`id -ng $1`
   }


###VALIDADORES   

is_email(){
  if [ `echo "$1" | grep "^[a-zA-Z0-9]*@[a-z]*\.[a-z]*"` ]
      then
        return 0
      else
        return 1
  fi
}

is_dni(){
  if [ `echo $1 | grep "^[0-9]\{8\}[a-z]$"` ]
    then 
      return 0
    else
      return 1
    fi
}

is_number() # valida si el dato es numerico
{    
     if [ `echo "$1" | grep "^[0-9][0-9]*$"` ] 
             then 
                 return 0
             else
                 return 1
     fi 
}

is_no_number(){
       if [ `echo "$1" | grep -v "^[0-9][0-9]*$"` ] 
             then 
                 return 0
             else
                 return 1
     fi 
}

is_phone_number()
{
  if [ `echo "$1" | grep "^[0-9]\{9\}$"` ]
    then
      return 0
    else
      return 1
    fi
}

is_phone_fixed_number()
{
  if [ `echo "$1" | grep "^9[0-9]\{8\}$"` ]
    then
      return 0
    else
      return 1
    fi
}

exist_file(){
  if [ -w $1 ]
    then 
      return 0
    else
      return 1
    fi
}