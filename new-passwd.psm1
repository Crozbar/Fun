function new-passwd {
    <#
    .DESCRIPTION
    
    Cette fonction génère une chaine de caractères pseudo aléatoire, de 20 caractères par défaut.
    
    .EXAMPLE
    $secret = ConvertTo-SecureString -String (new-passwd) -AsPlainText -force
    #>
    param([string]$nombre=20)
	-Join (((33..38)+(48..57)+(65..90)+(97..122)) | Get-Random -Count $nombre | % {[char]$_})
}

export-modulemember -Function 'new-passwd'
