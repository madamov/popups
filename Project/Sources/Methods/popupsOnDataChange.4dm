//%attributes = {}
C_TEXT:C284($1; $formObjectProperty)  // which property holds data to be displayed in popups
C_OBJECT:C1216($formEvent; $dummy)
C_POINTER:C301($objptr)
C_OBJECT:C1216($0)
C_TEXT:C284($methodToExecute)
C_POINTER:C301($objptr)

$formEvent:=FORM Event:C1606

If ($formEvent.objectName#Null:C1517)
	
	$formObjectProperty:=$1
	
	If (Form:C1466[$formObjectProperty][$formEvent.objectName]#Null:C1517)
		// one of our popups invoked event
		
		popupsExecuteMethod($formObjectProperty; $formEvent.objectName)
		
	End if 
	
End if 

