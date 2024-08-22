<#This script defines a function that gets a filename from the operator
Then it checks for and removes the Zone.Identifier stream#>
Function Get-FileName($initialDirectory)
{  
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
}

$ChosenFile = Get-FileName -initialDirectory $HOMEPATH
$streamArray = get-item $ChosenFile -Stream *
if($streamArray.stream.Contains("Zone.Identifier")){
	remove-item -path $ChosenFile -Stream "Zone.Identifier"
	}
