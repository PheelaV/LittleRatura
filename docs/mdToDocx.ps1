$mdFolder = "../_posts"
$docxFoler = "processed"
$prefixLength = 11;
$postfixLenth = 3;

Get-ChildItem $mdFolder | ForEach-Object {
    $length = $_.Name.Length - $prefixLength - $postfixLenth 
    $rawName = $_.Name.Substring($prefixLength, $length)
    $yamlBoundaries = 0;
    $yamlContent = @();    
    
    foreach($line in Get-Content $_.FullName) {         
        if($line -eq '---'){
            $yamlBoundaries++
            continue
        }
        if($yamlBoundaries -lt 2){
            $yamlContent += $line
        } else {          
            break
        }        
    }

    if($yamlContent.Length -ne 0){
        $yamlHeaderName = $docxFoler + '/' + $rawName + '.yml'
        Set-Content  $yamlHeaderName $yamlContent
    }

    # Get-Content $_.FullName   
    $docxName = $docxFoler + '/' + $rawName + '.docx'
    pandoc -s $_.FullName -o $docxName
    Write-Output $rawName;
}

Write-Output DONE;