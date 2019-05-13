$docsFolder = "docs"
$postOutput = '../_posts';
$docxOutput = $docsFolder + '/processed';
$queueFolder = './queue'
$date = Get-Date -UFormat "%Y-%m-%d";


Get-ChildItem $queueFolder | ForEach-Object { 
    $frontMatter = @();

    if ($_.Extension -eq '.yml') {
        continue
    }

    $rawName = $_.Name.Trim('.docx');
    $postName = $date + '-' + $rawName + '.md';
    $pageDownload = '/' + $docxOutput + '/' + $_.Name
    $yamlFileName = $rawName + '.yml'
    $yamlFileFullName = $queueFolder + '/' + $yamlFileName
    Write-Output $postName

    pandoc -s $_.FullName -t gfm -o $postName 

    $pageDownloadIncluded = $false

    if (Test-Path $yamlFileFullName) {
        
        [string[]]$fileContent = Get-Content $yamlFileFullName
        $content = @();

        foreach ($line in $fileContent) { 
            if ($line.Contains('pageDownload')) { 
                $content += $('pageDownload: ' + $pageDownload)
                $pageDownloadIncluded = $true
            } else {
                $content += $line
            }
        }

        if($pageDownloadIncluded -eq $false){
            $content += $('pageDownload: ' + $pageDownload)
        }

        $frontMatter += @(
            '---', 
            $content, 
            '---')

        Set-Content $yamlFileFullName $content

        Move-Item $yamlFileFullName $('../' + $docxOutput) 
    }
    else {
        $frontMatter = @(
            "---",
            "#see https://github.com/Feelav/LittleRatura/blob/master/README.md Posting new books",
            "title: ",
            "categories: []",
            "layout: post",
            "tags: []",
            "description: | čtenářský deník",
            $("pageDownload: " + $pageDownload),
            "---",
            "")
    }

    $frontMatter + (Get-Content $postName) | Set-Content $postName
   
    Move-Item $_.FullName $('../' + $docxOutput) 
    Move-Item $postName $postOutput
    
}
Write-Output 'DONE'
