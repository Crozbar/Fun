
#returns our public IP

function get-PublicIP {

   $uri = 'https://api.ipify.org'
   try {
       #crée un customObject
       $invokeRestIPify = @{
           Uri = $uri
           ErrorAction = "Stop"
       }
       $PublicIP = Invoke-RestMethod @invokeRestIPify
    }
    catch {
        Write-Error $_
    }

    return $PublicIP
}

export-modulemember -Function 'get-publicIP'