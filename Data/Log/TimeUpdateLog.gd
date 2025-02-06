extends Log_Entry
class_name Time_Update_Log

var day : int
var month : int
var year : int

func enact():
	if day == 1:
		for i in CountryData.countries[affected_country].resources:
			for j in CountryData.countries[affected_country].resources[i].income:
				CountryData.countries[affected_country].resources[i].amount += CountryData.countries[affected_country].resources[i].income[j]
	pass

func revoke():
	if day == 1:
		for i in CountryData.countries[affected_country].resources:
			for j in CountryData.countries[affected_country].resources[i].income:
				CountryData.countries[affected_country].resources[i].amount -= CountryData.countries[affected_country].resources[i].income[j]
	pass
