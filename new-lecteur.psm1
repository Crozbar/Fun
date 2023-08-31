<# Cette fonction humoristique détermine une lettre au hasard
et crée un lecteur réseau à partir d'une destination recueillie comme argument
#>
function new-lecteur {
	<#
	.EXAMPLE
	
	new-lecteur \\DC01\users\michelbouchel$
	#>
param([string]$chemin)
$lettre=(65..90) | Get-Random -Count 1 | % {[char]$_}
if (test-path $chemin){
	New-PSDrive -Root "$chemin" -Name "$lettre" -PSProvider "filesystem" -Persist
	}
}

export-modulemember -Function 'new-lecteur'
