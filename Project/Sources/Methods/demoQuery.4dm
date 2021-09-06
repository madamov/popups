//%attributes = {}
C_OBJECT:C1216($0;$1;$obj)

$obj:=$1

If ($obj#Null:C1517)
	
	Form:C1466.mydevices:=Form:C1466.devices.query("ClientID = :1";$obj.obj.ID)
	
End if 
