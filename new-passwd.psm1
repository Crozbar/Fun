function new-passwd {
    <#
    .DESCRIPTION
    
    Cette fonction génère une chaine de caractère pseudo aléatoire.
	Par défaut, celle-ci génère un mot de passe de 20 caractères

	.EXAMPLE
	$secret = ConvertTo-SecureString -String (new-passwd) -AsPlainText -force
	#>
    param([string]$nombre=20)
	-Join (((33..38)+(48..57)+(65..90)) | Get-Random -Count $nombre | % {[char]$_})
}

export-modulemember -Function 'new-passwd'