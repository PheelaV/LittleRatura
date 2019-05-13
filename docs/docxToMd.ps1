$docsFolder = "docs"
$postOutput = '../_posts';
$docxOutput = $docsFolder + '/processed';
$queueFolder = './queue'
$date = Get-Date -UFormat "%Y-%m-%d";


Get-ChildItem $queueFolder | ForEach-Object { 
    $frontMatter = @();

    if($_.Extension -eq '.yml'){
        continue
    }

    $rawName = $_.Name.Trim('.docx');
    $postName = $date + '-' + $rawName + '.md';
    $pageDownload = '/' + $docxOutput + '/' + $_.Name
    $yamlFileName = $rawName + '.yml'
    $yamlFileFullName = $queueFolder + '/' + $yamlFileName
    Write-Output $postName

    pandoc -s $_.FullName -t gfm -o $postName 
    if(Test-Path $yamlFileFullName){
        $frontMatter = Get-Content $yamlFileFullName

        Move-Item $yamlFileFullName $('../' + $docxOutput) 
    } else {
        $frontMatter = @(
            "---",
            "#see https://github.com/Feelav/LittleRatura/blob/master/README.md Posting new books",
            "title: ",
            "categories: []",
            "layout: post",
            "tags: []",
            $("pageDownload: " + $pageDownload),
            "description: | čtenářský deník",
            "---",
            "")
    }

    $frontMatter + (Get-Content $postName) | Set-Content $postName
   
    Move-Item $_.FullName $('../' + $docxOutput) 
    Move-Item $postName $postOutput
    
}
Write-Output 'DONE'
