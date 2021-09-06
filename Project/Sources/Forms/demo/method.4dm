Case of 
		
		
	: (Form event code:C388=On Load:K2:1)
		
		
		  // build demo data in memory, this can come from database also using ds.Table.all().toCollection()
		
		C_COLLECTION:C1488($clients;$devices)
		
		$clients:=New collection:C1472
		$clients.push(New object:C1471("ID";Generate UUID:C1066;"FirstName";"Milan";"LastName";"Adamov";"DOB";Add to date:C393(!00-00-00!;1965;10;26)))
		$clients.push(New object:C1471("ID";Generate UUID:C1066;"FirstName";"Jon";"LastName";"Snow";"DOB";Add to date:C393(!00-00-00!;1245;8;21)))
		$clients.push(New object:C1471("ID";Generate UUID:C1066;"FirstName";"Petar";"LastName";"Petrović";"DOB";Add to date:C393(!00-00-00!;2001;3;11)))
		$clients.push(New object:C1471("ID";Generate UUID:C1066;"FirstName";"Jovan";"LastName";"Jovanović";"DOB";Add to date:C393(!00-00-00!;1988;4;6)))
		
		Form:C1466.customers:=$clients
		
		  // create some related data
		
		C_OBJECT:C1216($person)
		
		$devices:=New collection:C1472
		
		C_LONGINT:C283($n)
		
		$n:=1
		
		For each ($person;$clients)
			$devices.push(New object:C1471("OrderNum";$n;"ID";Generate UUID:C1066;"ClientID";$person.ID;"type";"iPhone";"price";100*Random:C100))
			$devices.push(New object:C1471("OrderNum";$n;"ID";Generate UUID:C1066;"ClientID";$person.ID;"type";"iPad";"price";40*Random:C100))
			If (($n%2)=0)
				$devices.push(New object:C1471("OrderNum";$n;"ID";Generate UUID:C1066;"ClientID";$person.ID;"type";"computer";"price";200*Random:C100))
			End if 
			$n:=$n+1
		End for each 
		
		Form:C1466.devices:=$devices
		Form:C1466.mydevices:=$devices
		
		popupsInit ("popups";"mypopup";Form:C1466.customers;New collection:C1472(New object:C1471("propertyName";"FirstName";"separator";""));\
			New object:C1471("type";"index";"value";1);"demoQuery")
		
		popupsInit ("popups";"mypopup1";Form:C1466.customers;\
			New collection:C1472(New object:C1471("propertyName";"FirstName";"separator";" ");New object:C1471("propertyName";"LastName";"separator";""));\
			New object:C1471("type";"index";"value";2);"demoQuery")
		
		popupsInit ("popups";"mypopup2";Form:C1466.customers;\
			New collection:C1472(New object:C1471("propertyName";"FirstName";"separator";" ");New object:C1471("propertyName";"LastName";"separator";" - ");New object:C1471("propertyName";"DOB";"separator";""));\
			New object:C1471("type";"index";"value";3);"demoQuery")
		
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		
		C_OBJECT:C1216($selected)
		
		$selected:=popupsOnDataChange ("popups")
		
End case 
