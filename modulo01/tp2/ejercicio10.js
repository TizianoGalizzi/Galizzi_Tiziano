//CONSIGNA: Escribir un programa que reciba el número del mes y devuelva si tiene 31, 30 o menos días.
//Por ejemplo:12 = tiene 31 días.
num = prompt("Ingrese el numero del mes");
const meses = ["","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre",]
const dia = ["", "31","28","31","30","31","30","31","31","30","31","30","31",];
mes = meses[num]; //seleccionar un mes del array meses segun numero ingresado (num)
dias = dia[num]; //seleccionar cantidad de dias del mes segun numero ingresado (num)
document.write(mes + " tiene " + dias + " dias.");
