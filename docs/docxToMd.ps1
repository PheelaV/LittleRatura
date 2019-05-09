$outputDir = '../_posts';
$processedPath = './processed';
$date = Get-Date -UFormat "%Y-%m-%d";

Get-ChildItem .\queue\ | ForEach-Object { 
    $name = $_.Name.Trim('.docx');
    $outputName = $date + '-' + $name + '.md';
    if (Test-Path $outputDir + '/' + $outputName) {
        continue;
    }

    echo $outputName

    pandoc -s $_.FullName -t gfm -o $outputName 
    Move-Item $_.FullName $processedPath
    Move-Item $outputName $outputDir
}
echo 'DONE'
